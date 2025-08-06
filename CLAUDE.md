# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Homebrew tap repository (strrl/collective) that hosts custom Homebrew formulae for various tools. Homebrew taps are third-party repositories for distributing software via Homebrew on macOS.

## Formula Structure

All formulae are located in the `Formula/` directory. Each formula is a Ruby class that inherits from `Formula` and defines:
- Package metadata (desc, homepage, version, license)
- Download URLs and SHA256 checksums
- Platform-specific logic (using `on_macos` blocks and `Hardware::CPU` checks)
- Installation instructions (`install` method)
- Test procedures (`test` method)

## Common Development Tasks

### Testing a Formula Locally
```bash
# Install from local formula file
brew install --build-from-source ./Formula/<formula-name>.rb

# Test the installed binary
<formula-name> --help

# Uninstall for cleanup
brew uninstall <formula-name>
```

### Validating Formula Syntax
```bash
# Ruby syntax check
ruby -c Formula/<formula-name>.rb

# Use the Makefile check (only configured for shell-now currently)
make check
```

### Adding a New Formula

1. Create a new `.rb` file in `Formula/` directory
2. Follow the existing formula patterns (ttyd.rb for compiled packages, shell-now.rb or claude-resume.rb for binary releases)
3. For binary releases from GitHub:
   - Use `on_macos` block with CPU architecture detection
   - Specify correct download URLs and SHA256 checksums for each architecture
   - Handle binary naming in the `install` method (some binaries include platform suffixes)

### Architecture-Specific Handling

For formulae distributing pre-built binaries:
```ruby
on_macos do
  if Hardware::CPU.arm?
    url "https://github.com/USER/REPO/releases/download/VERSION/BINARY-darwin-arm64.tar.gz"
    sha256 "ARM64_SHA256"
  else
    url "https://github.com/USER/REPO/releases/download/VERSION/BINARY-darwin-amd64.tar.gz"
    sha256 "AMD64_SHA256"
  end
end
```

If extracted binaries have platform suffixes, rename during installation:
```ruby
def install
  if Hardware::CPU.arm?
    bin.install "binary-darwin-arm64" => "binary"
  else
    bin.install "binary-darwin-amd64" => "binary"
  end
end
```

## Available Formulae

- **ttyd**: Command-line tool for sharing terminal over the web (patched for Safari WebSocket Basic Auth)
- **shell-now**: Instant Web Terminal via ttyd + cloudflared
- **claude-resume**: Resume interrupted Claude Code conversations