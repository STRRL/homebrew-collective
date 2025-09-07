cask "transcube" do
  version "0.1.3"
  sha256 "7f6c200d365a24db8f18fcbb0aa3ba55eef30437f6780f84481f7ce70667660e"

  url "https://github.com/STRRL/transcube-webapp/releases/download/v#{version}/TransCube-#{version}-macOS.dmg",
      verified: "github.com/STRRL/transcube-webapp/"
  name "TransCube"
  desc "TransCube macOS app"
  homepage "https://github.com/STRRL/transcube-webapp"

  depends_on formula: "yt-dlp"
  depends_on formula: "ffmpeg"
  depends_on formula: "finnvoor/tools/yap"

  app "TransCube.app"
end
