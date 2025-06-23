class Ttyd < Formula
  desc "Command-line tool for sharing terminal over the web (Safari WebSocket fix)"
  homepage "https://tsl0922.github.io/ttyd/"
  url "https://github.com/tsl0922/ttyd/archive/refs/tags/1.7.7.tar.gz"
  sha256 "039dd995229377caee919898b7bd54484accec3bba49c118e2d5cd6ec51e3650"
  license "MIT"
  version "1.7.7-1"
  head "https://github.com/tsl0922/ttyd.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "json-c"
  depends_on "libevent"
  depends_on "libuv"
  depends_on "libwebsockets"
  depends_on "openssl@3"

  uses_from_macos "vim" # needed for xxd
  uses_from_macos "zlib"

  # Safari WebSocket Basic Auth fix
  patch :DATA

  def install
    system "cmake", "-S", ".", "-B", "build",
                    "-DOPENSSL_ROOT_DIR=#{Formula["openssl@3"].opt_prefix}",
                    "-Dlibwebsockets_DIR=#{Formula["libwebsockets"].opt_lib}/cmake/libwebsockets",
                    *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    port = free_port
    fork do
      system bin/"ttyd", "--port", port.to_s, "bash"
    end
    sleep 5

    system "curl", "-sI", "http://localhost:#{port}"
  end
end

__END__
diff --git a/src/protocol.c b/src/protocol.c
index 53e65d4..ff3d05c 100644
--- a/src/protocol.c
+++ b/src/protocol.c
@@ -209,8 +209,6 @@ int callback_tty(struct lws *wsi, enum lws_callback_reasons reason, void *user,
         lwsl_warn("refuse to serve WS client due to the --max-clients option.\n");
         return 1;
       }
-      if (!check_auth(wsi, pss)) return 1;
-
       n = lws_hdr_copy(wsi, pss->path, sizeof(pss->path), WSI_TOKEN_GET_URI);
 #if defined(LWS_ROLE_H2)
       if (n <= 0) n = lws_hdr_copy(wsi, pss->path, sizeof(pss->path), WSI_TOKEN_HTTP_COLON_PATH);
@@ -220,6 +218,12 @@ int callback_tty(struct lws *wsi, enum lws_callback_reasons reason, void *user,
         return 1;
       }
 
+      // Skip Basic Auth check for WebSocket path when credentials are configured
+      // Safari doesn't support Basic Auth headers with WebSocket, rely on AuthToken instead
+      if (server->credential == NULL || server->auth_header != NULL) {
+        if (!check_auth(wsi, pss)) return 1;
+      }
+
       if (server->check_origin && !check_host_origin(wsi)) {
         lwsl_warn(
             "refuse to serve WS client from different origin due to the "