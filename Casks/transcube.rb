cask "transcube" do
  version "0.1.9"
  sha256 "fdd867233cef9056519f2d8978827a196df2e147a8231d72895ca08faff394ca"

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
