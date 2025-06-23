class ShellNow < Formula
  desc "Instant Web Terminal via ttyd + cloudflared - A one-click webshell for developers"
  homepage "https://github.com/STRRL/shell-now"
  version "0.1.1"
  license "MIT"

  depends_on "strrl/collective/ttyd"
  depends_on "cloudflared"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STRRL/shell-now/releases/download/v0.1.1/shell-now_Darwin_arm64.tar.gz"
      sha256 "d891079747f8f14e903aa5160511dac2131374663eb8026c5a56433016e280f1"
    else
      url "https://github.com/STRRL/shell-now/releases/download/v0.1.1/shell-now_Darwin_x86_64.tar.gz"
      sha256 "9be0d59fef7ca3a4cc67bc50854f4e64c1e83d81adaeaf06c346cb969b568357"
    end
  end

  def install
    bin.install "shell-now"
  end

  def caveats
    <<~EOS
      WARNING: shell-now exposes your local shell to the public internet.
      Use with caution and ensure you understand the security implications.
      
      The tool automatically downloads ttyd and cloudflared dependencies
      when first run.
    EOS
  end

  test do
    assert_match "shell-now", shell_output("#{bin}/shell-now --help")
  end
end
