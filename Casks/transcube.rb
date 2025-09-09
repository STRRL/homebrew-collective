cask "transcube" do
  version "0.1.5"
  sha256 "7434a49771e4827fc7fdc9791b69868df321602a388ad8fa8d45bd97a1da96b4"

  url "https://github.com/STRRL/transcube-webapp/releases/download/v#{version}/TransCube-#{version}-macOS.dmg"
  name "TransCube"
  desc "Audio/video transcoding and transcription app"
  homepage "https://github.com/STRRL/transcube-webapp"

  depends_on :macos
  depends_on macos: :tahoe
  depends_on formula: "yt-dlp"
  depends_on formula: "ffmpeg"
  depends_on formula: "finnvoor/tools/yap"

  app "TransCube.app"
end
