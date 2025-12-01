cask "transcube" do
  version "0.1.11"
  sha256 "3f32618d336260570d4cd9f521f6d54cf388b5d3529b51c57c389605bca0371b"

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
