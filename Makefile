.PHONY: check help

# Default target
all: help

# Check the formula syntax and style
check:
	@echo "🍺 Homebrew Formula Validation"
	@echo "1️⃣ Cleaning up previous installation..."
	brew uninstall shell-now || true
	@echo "2️⃣ Installing formula..."
	HOMEBREW_NO_AUTO_UPDATE=1 brew install --build-from-source Formula/shell-now.rb
	@echo "3️⃣ Checking formula syntax..."
	ruby -c Formula/shell-now.rb
	@echo "4️⃣ Testing installed binary..."
	shell-now --help
	@echo "✅ Validation completed successfully!"

# Help target
help:
	@echo "Available targets:"
	@echo "  check    - Validate formula (install, audit, test)"
	@echo "  help     - Show this help message"