cask "transcube" do
  version "0.1.7"
  sha256 "2e28a92afe0e69abb508accba9cce00398452a2121231f85890ec29032df503e"

  url "https://github.com/STRRL/transcube-webapp/releases/download/v#{version}/TransCube-#{version}-macOS.dmg"
  name "TransCube"
  desc "Audio/video transcoding and transcription app"
  homepage "https://github.com/STRRL/transcube-webapp"

  depends_on macos: ">= :tahoe"

  depends_on formula: "yt-dlp"
  depends_on formula: "ffmpeg"
  depends_on formula: "finnvoor/tools/yap"

  app "TransCube.app"
end
