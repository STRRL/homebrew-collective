cask "transcube" do
  version "0.1.6"
  sha256 "424f843a59feb80feb974b8570dae7244a8340caf3cffdae6f8db7e7a3279d54"

  url "https://github.com/STRRL/transcube-webapp/releases/download/v#{version}/TransCube-#{version}-macOS.dmg"
  name "TransCube"
  desc "Audio/video transcoding and transcription app"
  homepage "https://github.com/STRRL/transcube-webapp"

  depends_on macos: ">= :tahoe"

  app "TransCube.app"
end
