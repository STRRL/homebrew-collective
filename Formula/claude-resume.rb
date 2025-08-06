class ClaudeResume < Formula
  desc "Resume interrupted Claude Code conversations"
  homepage "https://github.com/STRRL/claude-resume"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/STRRL/claude-resume/releases/download/v0.1.5/claude-resume-darwin-arm64.tar.gz"
      sha256 "f4f32fa082ce79b0d63794ce407ffd1e2c6333781becabbb129e0c3c3d571315"
    else
      url "https://github.com/STRRL/claude-resume/releases/download/v0.1.5/claude-resume-darwin-amd64.tar.gz"
      sha256 "2e6941669e24eebca6fdc46e0c15b78022b6bf48a21316b4bf4c6b3c2dcb9dd6"
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