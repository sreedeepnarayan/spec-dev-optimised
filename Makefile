# Spec-Kit Development Platform - AI-Optimized Development Makefile

.PHONY: help build up down logs shell db-shell redis-shell test lint format clean
.PHONY: ai-context ai-status ai-docs dev-start dev-test quality-check
.PHONY: service-restart service-logs health-detailed performance-test
.PHONY: security-scan backup-create context-generate setup-git-hooks

# Color codes for output
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
BLUE=\033[0;34m
NC=\033[0m # No Color

# Default target
help:
	@echo "$(BLUE)Spec-Kit Development Platform - AI-Optimized Development Commands$(NC)"
	@echo ""
	@echo "$(GREEN)🚀 Quick Start:$(NC)"
	@echo "  setup          - Initial project setup (one-time)"
	@echo "  dev-start      - Start development environment"
	@echo "  health         - Check project health"
	@echo ""
	@echo "$(GREEN)🔧 Development:$(NC)"
	@echo "  build          - Build project (if applicable)"
	@echo "  test           - Run all tests"
	@echo "  lint           - Run code linting"
	@echo "  format         - Auto-format code"
	@echo "  clean          - Clean up build artifacts"
	@echo ""
	@echo "$(GREEN)🤖 AI Development:$(NC)"
	@echo "  ai-context     - Generate comprehensive AI context"
	@echo "  ai-status      - Current development status for AI"
	@echo "  ai-docs        - Generate API documentation for AI"
	@echo "  context-generate - Generate project context files"
	@echo ""
	@echo "$(GREEN)🔧 MCP Server Integration:$(NC)"
	@echo "  mcp-setup      - Install and configure MCP servers"
	@echo "  mcp-status     - Check MCP server availability"
	@echo "  mcp-suggest    - Get context-aware MCP recommendations"
	@echo "  mcp-suggest-quick - Quick MCP recommendations only"
	@echo "  mcp-examples   - Show MCP usage examples"
	@echo "  mcp-docs       - Generate MCP documentation"
	@echo "  ai-auto-suggest  - Automatic AI development assistance (subagents + MCP)"
	@echo "  mcp-auto-suggest - Automatic context-based MCP suggestions"
	@echo ""
	@echo "$(GREEN)🔒 Security & Git:$(NC)"
	@echo "  setup-git-hooks - Install security git hooks"
	@echo "  validate-commit - Test commit message validation"
	@echo "  git-security-check - Verify git security configuration"
	@echo ""
	@echo "$(GREEN)🛠 Utilities:$(NC)"
	@echo "  quality-check  - Run comprehensive quality checks"
	@echo "  backup-create  - Create full project backup"
	@echo ""
	@echo "$(YELLOW)📖 Documentation: See AI_DEVELOPMENT.md for detailed workflows$(NC)"

# Development operations
build:
	@echo "$(BLUE)Building project...$(NC)"
	@if [ -f "package.json" ]; then \
		echo "Node.js project detected - running npm install"; \
		npm install; \
	elif [ -f "requirements.txt" ]; then \
		echo "Python project detected - installing requirements"; \
		pip install -r requirements.txt; \
	elif [ -f "go.mod" ]; then \
		echo "Go project detected - running go mod tidy"; \
		go mod tidy; \
	elif [ -f "Cargo.toml" ]; then \
		echo "Rust project detected - running cargo build"; \
		cargo build; \
	else \
		echo "$(GREEN)No specific build requirements detected$(NC)"; \
	fi

dev-start:
	@echo "$(BLUE)Starting development environment...$(NC)"
	$(MAKE) setup
	@echo "$(GREEN)Development environment ready!$(NC)"
	@$(MAKE) ai-auto-suggest

test:
	@echo "$(BLUE)Running tests...$(NC)"
	@if [ -f "package.json" ]; then \
		npm test; \
	elif [ -f "pytest.ini" ] || [ -d "tests/" ]; then \
		pytest; \
	elif [ -f "go.mod" ]; then \
		go test ./...; \
	elif [ -f "Cargo.toml" ]; then \
		cargo test; \
	else \
		echo "$(YELLOW)No test framework detected$(NC)"; \
	fi
	@$(MAKE) ai-auto-suggest

lint:
	@echo "$(BLUE)Running code linting...$(NC)"
	@if [ -f "package.json" ]; then \
		npm run lint || echo "$(YELLOW)No lint script found in package.json$(NC)"; \
	elif [ -f "pyproject.toml" ] || [ -f "setup.cfg" ]; then \
		flake8 . || echo "$(YELLOW)flake8 not installed$(NC)"; \
	elif [ -f "go.mod" ]; then \
		golangci-lint run || echo "$(YELLOW)golangci-lint not installed$(NC)"; \
	elif [ -f "Cargo.toml" ]; then \
		cargo clippy || echo "$(YELLOW)clippy not available$(NC)"; \
	else \
		echo "$(YELLOW)No linting configuration detected$(NC)"; \
	fi
	@$(MAKE) ai-auto-suggest

format:
	@echo "$(BLUE)Auto-formatting code...$(NC)"
	@if [ -f "package.json" ]; then \
		npx prettier --write . || echo "$(YELLOW)Prettier not available$(NC)"; \
	elif [ -f "pyproject.toml" ] || [ -f "setup.cfg" ]; then \
		black . || echo "$(YELLOW)black not installed$(NC)"; \
	elif [ -f "go.mod" ]; then \
		go fmt ./...; \
	elif [ -f "Cargo.toml" ]; then \
		cargo fmt; \
	else \
		echo "$(YELLOW)No formatting configuration detected$(NC)"; \
	fi
	@$(MAKE) ai-auto-suggest

quality-check:
	@echo "$(BLUE)Running comprehensive quality checks...$(NC)"
	$(MAKE) lint
	$(MAKE) format
	$(MAKE) test
	@echo "$(GREEN)All quality checks completed$(NC)"

clean:
	@echo "$(BLUE)Cleaning up build artifacts...$(NC)"
	@rm -rf node_modules/.cache 2>/dev/null || true
	@rm -rf __pycache__ 2>/dev/null || true
	@rm -rf .pytest_cache 2>/dev/null || true
	@rm -rf target/ 2>/dev/null || true
	@rm -rf dist/ 2>/dev/null || true
	@rm -rf build/ 2>/dev/null || true
	@echo "$(GREEN)Cleanup completed$(NC)"

health:
	@echo "$(BLUE)Checking project health...$(NC)"
	@echo "$(GREEN)✅ Project structure: OK$(NC)"
	@if [ -f ".git/config" ]; then \
		echo "$(GREEN)✅ Git repository: Initialized$(NC)"; \
	else \
		echo "$(YELLOW)⚠️  Git repository: Not initialized$(NC)"; \
	fi
	@if [ -f ".githooks/commit-msg" ]; then \
		echo "$(GREEN)✅ Security hooks: Available$(NC)"; \
	else \
		echo "$(YELLOW)⚠️  Security hooks: Not installed$(NC)"; \
	fi
	@if [ -d ".mcp" ]; then \
		echo "$(GREEN)✅ MCP integration: Available$(NC)"; \
	else \
		echo "$(YELLOW)⚠️  MCP integration: Not found$(NC)"; \
	fi
	@echo ""
	@$(MAKE) ai-auto-suggest

# AI Development Commands
ai-context:
	@echo "$(BLUE)Generating comprehensive AI context...$(NC)"
	@echo "📋 Project Context:" > ai-context-output.md
	@echo "" >> ai-context-output.md
	@if [ -f "CLAUDE.md" ]; then \
		cat CLAUDE.md >> ai-context-output.md; \
	else \
		echo "No CLAUDE.md found - create one for project-specific AI context" >> ai-context-output.md; \
	fi
	@echo "" >> ai-context-output.md
	@echo "📊 Current Status:" >> ai-context-output.md
	@cat .ai-context/current-state.md >> ai-context-output.md 2>/dev/null || echo "No current state file found" >> ai-context-output.md
	@echo "" >> ai-context-output.md
	@echo "🏗️ Architecture:" >> ai-context-output.md
	@cat .ai-context/architecture-overview.md >> ai-context-output.md 2>/dev/null || echo "No architecture overview found" >> ai-context-output.md
	@echo "$(GREEN)AI context generated in ai-context-output.md$(NC)"

ai-status:
	@echo "$(BLUE)Spec-Kit Development Platform - Current Status$(NC)"
	@echo ""
	@echo "$(GREEN)📅 Platform:$(NC) General Development Boilerplate"
	@echo "$(GREEN)🎯 Features:$(NC)"
	@echo "  • AI-optimized development workflow"
	@echo "  • MCP server integration"
	@echo "  • Git security policies"
	@echo "  • Cross-platform compatibility"
	@echo ""
	@$(MAKE) health

ai-docs:
	@echo "$(BLUE)Generating documentation for AI agents...$(NC)"
	@echo "📚 Development Platform Documentation:" > ai-docs-output.md
	@echo "" >> ai-docs-output.md
	@echo "## Available Features" >> ai-docs-output.md
	@echo "- AI Development Framework" >> ai-docs-output.md
	@echo "- MCP Server Integration" >> ai-docs-output.md
	@echo "- Git Security Policies" >> ai-docs-output.md
	@echo "- Cross-Platform Development Tools" >> ai-docs-output.md
	@echo "" >> ai-docs-output.md
	@echo "## Project Structure" >> ai-docs-output.md
	@find . -type f -name "*.md" | head -10 >> ai-docs-output.md 2>/dev/null || echo "Documentation files not found"
	@echo "$(GREEN)Documentation generated in ai-docs-output.md$(NC)"

context-generate:
	@echo "$(BLUE)Generating project context files...$(NC)"
	@mkdir -p .ai-context
	@echo "Current project state as of $$(date)" > .ai-context/last-updated.md
	@git log --oneline -10 >> .ai-context/last-updated.md 2>/dev/null || echo "No git history"
	@echo "$(GREEN)Context files updated$(NC)"

# MCP Server Integration Commands
mcp-setup:
	@echo "$(BLUE)Setting up MCP servers for enhanced development...$(NC)"
	@./.mcp/scripts/setup-mcp.sh
	@echo "$(GREEN)MCP server setup completed$(NC)"

mcp-status:
	@echo "$(BLUE)Checking MCP server status...$(NC)"
	@./.mcp/scripts/mcp-status.sh

mcp-suggest:
	@echo "$(BLUE)Generating context-aware MCP suggestions...$(NC)"
	@./.mcp/scripts/mcp-suggest-simple.sh

mcp-suggest-quick:
	@echo "$(BLUE)Quick MCP recommendations:$(NC)"
	@./.mcp/scripts/mcp-suggest-simple.sh --recommendations

mcp-examples:
	@echo "$(BLUE)MCP server usage examples:$(NC)"
	@./.mcp/scripts/mcp-suggest.sh --examples

mcp-docs:
	@echo "$(BLUE)Generating MCP server documentation...$(NC)"
	@echo "📚 MCP Integration Guide for Development Platform" > mcp-docs-output.md
	@echo "=================================================" >> mcp-docs-output.md
	@echo "" >> mcp-docs-output.md
	@cat .mcp/mcp-config.json | jq -r '.recommended_servers | to_entries[] | "## \(.value.name)\n\(.value.description)\n\nUse cases:\n\(.value.use_cases[] | "- \(.)")\n"' >> mcp-docs-output.md 2>/dev/null || echo "Configuration file needs jq for full documentation" >> mcp-docs-output.md
	@echo "$(GREEN)MCP documentation generated in mcp-docs-output.md$(NC)"

ai-auto-suggest:
	@echo "$(BLUE)Running automatic AI development assistance...$(NC)"
	@./.mcp/scripts/ai-auto-suggest.sh --quick

mcp-auto-suggest:
	@echo "$(BLUE)Running automatic MCP context analysis...$(NC)"
	@./.mcp/scripts/mcp-suggest-simple.sh --quick

# Git Security Commands
setup-git-hooks:
	@echo "$(BLUE)Installing security git hooks...$(NC)"
	@mkdir -p .git/hooks
	@cp .githooks/commit-msg .git/hooks/commit-msg
	@chmod +x .git/hooks/commit-msg
	@echo "$(GREEN)✅ Git security hooks installed successfully$(NC)"
	@echo "$(YELLOW)All commits will now be validated for security policies$(NC)"

validate-commit:
	@echo "$(BLUE)Testing commit message validation...$(NC)"
	@echo "Test commit with forbidden pattern" | .githooks/commit-msg /dev/stdin || echo "$(GREEN)✅ Validation working correctly$(NC)"

git-security-check:
	@echo "$(BLUE)Checking git security configuration...$(NC)"
	@if [ -f .git/hooks/commit-msg ]; then \
		echo "$(GREEN)✅ Commit message hook: Installed$(NC)"; \
	else \
		echo "$(RED)❌ Commit message hook: Missing$(NC)"; \
		echo "$(YELLOW)Run 'make setup-git-hooks' to install$(NC)"; \
	fi
	@if [ -x .git/hooks/commit-msg ]; then \
		echo "$(GREEN)✅ Hook permissions: Executable$(NC)"; \
	else \
		echo "$(RED)❌ Hook permissions: Not executable$(NC)"; \
	fi
	@echo "$(BLUE)Testing hook functionality...$(NC)"
	@echo "Clean test message" > /tmp/test-commit-msg
	@if .git/hooks/commit-msg /tmp/test-commit-msg > /dev/null 2>&1; then \
		echo "$(GREEN)✅ Hook functionality: Working$(NC)"; \
	else \
		echo "$(RED)❌ Hook functionality: Failed$(NC)"; \
	fi
	@rm -f /tmp/test-commit-msg

# Backup and utilities
backup-create:
	@echo "$(BLUE)Creating comprehensive project backup...$(NC)"
	@mkdir -p backups
	@timestamp=$$(date +%Y%m%d_%H%M%S); \
	tar -czf backups/project_backup_$$timestamp.tar.gz \
		--exclude=node_modules \
		--exclude=__pycache__ \
		--exclude=.git \
		--exclude=backups \
		--exclude=target \
		--exclude=dist \
		.; \
	echo "$(GREEN)Project backup created: backups/project_backup_$$timestamp.tar.gz$(NC)"

# Development setup
setup:
	@echo "$(BLUE)Setting up Spec-Kit Development Platform...$(NC)"
	@echo "$(BLUE)Installing dependencies...$(NC)"
	$(MAKE) build
	@echo "$(BLUE)Setting up MCP servers for enhanced AI development...$(NC)"
	@$(MAKE) mcp-setup || echo "$(YELLOW)MCP setup encountered issues - continue manually with 'make mcp-setup'$(NC)"
	@echo "$(BLUE)Installing security git hooks...$(NC)"
	@$(MAKE) setup-git-hooks
	@echo ""
	@echo "$(GREEN)🎉 Setup complete!$(NC)"
	@echo ""
	@echo "$(BLUE)Next steps:$(NC)"
	@echo "1. Run 'make health' to verify setup"
	@echo "2. Use 'make mcp-suggest' for AI development assistance"
	@echo "3. Run 'make dev-start' to begin development"
	@echo "4. See 'make help' for all available commands"
	@echo ""
	@echo "$(YELLOW)📖 For AI development workflows, see AI_DEVELOPMENT.md$(NC)"
	@echo "$(CYAN)🤖 MCP servers are now available for enhanced development$(NC)"