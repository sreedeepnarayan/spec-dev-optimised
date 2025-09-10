# Spec-Kit Development Platform - Claude AI Agent Memory

## Project Context

**Spec-Kit Development Platform** is an AI-optimized development boilerplate that provides intelligent automation, MCP server integration, and enhanced development workflows for any type of software project.

### Vision
Provide developers with the most advanced AI-assisted development environment, featuring automatic context-aware suggestions, intelligent tooling, and seamless integration with modern development practices.

### Key Value Propositions
- **Instant AI-enhanced setup** with automated development environment
- **Context-aware MCP server suggestions** based on your current work
- **Automatic security policies** with git commit validation
- **Cross-platform compatibility** for any development stack
- **Zero-configuration AI development** tools

## Architecture Summary

### Technology Stack
- **AI Integration**: MCP (Model Context Protocol) server ecosystem
- **Security**: Automated git hooks with commit validation
- **Development**: Cross-platform Makefile with intelligent detection
- **Documentation**: Comprehensive AI development guides
- **Context Management**: Structured AI context generation

### Core Components
```
┌─────────────────────────────────────────────────────────────┐
│                    Development Environment                    │
├─────────────────────────────────────────────────────────────┤
│                     Makefile Automation                      │
├──────────────┬──────────────┬──────────────┬───────────────┤
│  MCP Servers │ Git Security │ AI Context   │ Quality Tools │
│   (.mcp/)    │ (.githooks/) │(.ai-context/)│   (lint/test) │
├──────────────┴──────────────┴──────────────┴───────────────┤
│                    Your Project Code                          │
└─────────────────────────────────────────────────────────────┘
```

### AI Enhancement Layer
1. **MCP Integration**: Context-aware server suggestions and setup
2. **Git Security**: Automated commit message validation
3. **Development Automation**: Intelligent project detection and tooling
4. **Context Generation**: Structured information for AI agents

## Current State

### Core Features (Implemented)
- ✅ **Cross-Platform Makefile**: Detects and works with Node.js, Python, Go, Rust
- ✅ **Automatic AI Assistance**: Every command includes subagent + MCP recommendations  
- ✅ **MCP Server Integration**: Full ecosystem with context-aware suggestions
- ✅ **Git Security Hooks**: Automated commit validation and security policies
- ✅ **AI Development Framework**: Comprehensive documentation and workflows
- ✅ **Quality Tools**: Automated linting, formatting, testing for multiple languages

### Available Integrations
- **Node.js/JavaScript**: npm, prettier, eslint
- **Python**: pip, black, flake8, pytest
- **Go**: go mod, gofmt, golangci-lint
- **Rust**: cargo build/test/fmt/clippy
- **General**: git, MCP servers, AI context generation

## Development Patterns

### Project Structure
```
your-project/
├── .mcp/                    # MCP server configurations
│   ├── scripts/            # MCP automation scripts
│   ├── servers/            # Server configurations
│   └── recommendations/    # Context-aware rules
├── .githooks/              # Security git hooks
├── .ai-context/            # AI development context
├── AI_DEVELOPMENT.md       # AI development guide
├── MCP_INTEGRATION.md      # MCP server documentation
├── GIT_SECURITY_POLICIES.md # Security policies
├── Makefile               # Development automation
└── your-code/             # Your actual project
```

### Workflow Integration
- **Setup**: `make setup` - One command full environment setup + AI guidance
- **Development**: `make dev-start` - Start development with automatic AI suggestions
- **Quality**: `make quality-check` - Comprehensive code quality validation + AI tips
- **Testing**: `make test` - Run tests + testing strategy recommendations
- **AI Assistance**: `make ai-auto-suggest` - Manual trigger for AI recommendations
- **🚀 NEW**: Every command automatically provides context-aware AI assistance!

## Key Commands

### Essential Development Commands
```bash
# Quick start any project type
make setup              # Full environment setup including AI tools

# Development workflow
make dev-start          # Start development with AI suggestions
make health             # Check project health + MCP suggestions
make test               # Run tests (auto-detects framework)
make lint               # Run linting (auto-detects tools)
make format             # Auto-format code (multi-language)
make quality-check      # Comprehensive quality validation

# AI Development Integration (AUTOMATIC for ALL commands!)
make ai-auto-suggest    # Manual trigger for AI recommendations (subagents + MCP)
make mcp-setup          # Install and configure MCP servers
make mcp-status         # Check MCP server availability
make mcp-suggest        # Get context-aware MCP recommendations
make mcp-suggest-quick  # Quick recommendations only
make mcp-examples       # Show usage examples
make mcp-docs           # Generate MCP documentation
make mcp-auto-suggest   # Automatic context-based MCP suggestions

# 🚀 NEW: Every command above now includes automatic AI assistance!
# - Subagent recommendations for complex tasks
# - MCP server suggestions based on context
# - Project-specific development guidance
# - Next-step recommendations

# Security & Git
setup-git-hooks         # Install security git hooks
validate-commit         # Test commit message validation
git-security-check      # Verify git security configuration
```

### Auto-Detection Features
The platform automatically detects your project type and provides appropriate tooling:
- **package.json** → Node.js workflow (npm, prettier, eslint)
- **requirements.txt/pyproject.toml** → Python workflow (pip, black, flake8)
- **go.mod** → Go workflow (go fmt, golangci-lint)
- **Cargo.toml** → Rust workflow (cargo fmt, clippy)

## Subagent Usage Guidelines

### When to Use Task Tool
1. **Complex Multi-language Projects** (multiple tech stacks)
2. **Large Codebase Analysis** (requires context-aware tools)
3. **Cross-Platform Development** (multiple environments)
4. **AI-Enhanced Workflows** (MCP server integration)

### Effective Task Breakdown Examples
```
Feature: "Set up full-stack development environment"
├── Task 1: Detect project technologies
├── Task 2: Install appropriate MCP servers
├── Task 3: Configure development tools
├── Task 4: Set up security policies
└── Task 5: Verify complete integration
```

## MCP Server Integration

### Available MCP Servers
The platform includes context-aware MCP server suggestions:

#### Core MCP Servers
- **PostgreSQL/Database MCP**: Direct database operations and analysis
- **Fetch MCP**: API testing, webhook validation, HTTP operations
- **Filesystem MCP**: Advanced file operations, codebase analysis
- **Git MCP**: Repository analysis, code history investigation

### Context-Aware Recommendations
The system automatically suggests relevant MCP servers based on:
- **Current working directory** (backend → database, frontend → API testing)
- **Recent file modifications** (API files → fetch server, models → database)
- **Project structure** (presence of specific frameworks and tools)
- **Development context** (testing phase → testing servers)

### Universal Configurations
- **Security-first**: All MCP servers configured with security best practices
- **Development-focused**: Optimized for development workflows
- **Cross-platform**: Works on macOS, Linux, Windows
- **Framework-agnostic**: Adapts to any development stack

## Memory Optimization

### Context Preservation Strategy
1. **Always read CLAUDE.md first** - Contains project-specific context
2. **Check .ai-context/ files** - Understand current development state
3. **Review recent changes** - See what was last worked on
4. **Use MCP suggestions** - Get context-aware tool recommendations

### Session Continuity Techniques
- **Start each session** by reading project status files
- **End each session** by updating relevant documentation
- **Document decisions** in project-specific files
- **Maintain TODO lists** for incomplete work
- **Leverage MCP servers** for enhanced context understanding

### Critical Files to Reference
- `/CLAUDE.md` - Project-specific development memory
- `/AI_DEVELOPMENT.md` - AI development workflows
- `/MCP_INTEGRATION.md` - MCP server integration guide
- `/.ai-context/` - Structured context for AI agents
- `/Makefile` - Development automation commands

## Development Workflow Optimization

### Pre-Development Checklist
- [ ] Read project-specific CLAUDE.md
- [ ] Check git status and recent commits
- [ ] Run `make health` to verify environment
- [ ] Get MCP suggestions with `make mcp-suggest`

### Post-Development Checklist
- [ ] Run quality checks with `make quality-check`
- [ ] Update project documentation if needed
- [ ] Use `make health` to verify everything works
- [ ] Commit with descriptive messages (auto-validated)

### Context Switching Between Sessions
1. **Session Start**: `make health`, read recent changes
2. **During Development**: Use MCP servers for enhanced capabilities
3. **Session End**: Run quality checks, commit work
4. **Next Session**: Review previous session's changes

## Platform Customization

### Adding New Language Support
1. **Edit Makefile** - Add detection and tool commands
2. **Update MCP configs** - Add language-specific server suggestions
3. **Test integration** - Verify all commands work correctly

### Project-Specific Customization
1. **Create project CLAUDE.md** - Add specific context and requirements
2. **Customize .ai-context/** - Add project-specific context files
3. **Update MCP configs** - Adjust for project-specific needs

---

**Last Updated**: 2025-09-10  
**Platform**: General Development Boilerplate  
**Features**: AI-optimized, MCP-integrated, Security-enhanced  
**Compatibility**: Cross-platform, Multi-language, Framework-agnostic