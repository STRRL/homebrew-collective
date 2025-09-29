cask "transcube" do
  version "0.1.8"
  sha256 "fd1595426417d499af4c6cb7f8444cc98d119b9cdf9ee0a6a38fd49b7c984698"

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
