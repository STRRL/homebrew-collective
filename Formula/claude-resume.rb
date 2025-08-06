class ClaudeResume < Formula
  desc "Resume interrupted Claude Code conversations"
  homepage "https://github.com/STRRL/claude-resume"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STRRL/claude-resume/releases/download/v0.1.4/claude-resume-darwin-arm64.tar.gz"
      sha256 "cb6ed7358b46e13755a5c7e986f5fc13d2f4b576bfd9cfdaf89da8811edd5b05"
    else
      url "https://github.com/STRRL/claude-resume/releases/download/v0.1.4/claude-resume-darwin-amd64.tar.gz"
      sha256 "671dff794707b29b3843b32e2325b83122c34b9ae18c45686ee37aaf9f793f26"
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