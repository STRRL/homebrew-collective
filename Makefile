.PHONY: check help

# Default target
all: help

# Check the formula syntax and style
check:
	@echo "🍺 Homebrew Tap Validation Pipeline"
	@echo "1️⃣ Creating temporary tap..."
	brew tap-new strrl/collective || true
	brew tap strrl/collective ~/dev/homebrew-collective || true
	@echo "2️⃣ Installing formula..."
	brew install shell-now
	@echo "3️⃣ Auditing formula..."
	brew audit --strict shell-now
	@echo "4️⃣ Testing formula..."
	brew test shell-now
	@echo "✅ Pipeline completed successfully!"

# Help target
help:
	@echo "Available targets:"
	@echo "  check    - Full validation pipeline (tap-new, install, audit, test)"
	@echo "  help     - Show this help message"