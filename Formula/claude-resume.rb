class ClaudeResume < Formula
  desc "Resume interrupted Claude Code conversations"
  homepage "https://github.com/STRRL/claude-resume"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STRRL/claude-resume/releases/download/v0.1.3/claude-resume-darwin-arm64.tar.gz"
      sha256 "6e4063f079108408cf67bc6223d6a55e85b5b0dd2a801ecffc51e8b6bae6883b"
    else
      url "https://github.com/STRRL/claude-resume/releases/download/v0.1.3/claude-resume-darwin-amd64.tar.gz"
      sha256 "32135b2ef687120cff2bc7e59fde2780f630b215bfc7e631447b03e9814b82ce"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "claude-resume-darwin-arm64" => "claude-resume"
    else
      bin.install "claude-resume-darwin-amd64" => "claude-resume"
    end
  end

  test do
    assert_match "claude-resume", shell_output("#{bin}/claude-resume --help", 2)
  end
end