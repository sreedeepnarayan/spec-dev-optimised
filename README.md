# Spec-Kit: AI-Optimized Development Platform

> **The most advanced development boilerplate with built-in AI assistance, MCP server integration, and intelligent automation.**

## 🚀 What Makes This Special

This isn't just another boilerplate. It's a **complete AI-enhanced development platform** that:

- **🤖 AI-First Development**: Built-in MCP server integration with context-aware suggestions
- **🔒 Security by Default**: Automated git hooks that prevent security issues
- **⚡ Cross-Platform Intelligence**: Auto-detects your tech stack and provides appropriate tooling
- **📚 Zero Configuration**: Works out of the box with Node.js, Python, Go, Rust, and more
- **🎯 Context-Aware**: Intelligent recommendations based on what you're actually working on

## ✨ Quick Start

```bash
# Clone and setup in one command
git clone https://github.com/sreedeepnarayan/spec-dev-optimised.git my-project
cd my-project
make setup

# That's it! You now have:
# ✅ AI-enhanced development environment
# ✅ Context-aware MCP server suggestions  
# ✅ Automated security policies
# ✅ Cross-platform development tools
# ✅ Quality assurance automation
```

## 🎯 Key Features

### 🤖 **MCP Server Integration**
Get intelligent suggestions for development tools based on your current context:
```bash
make mcp-suggest  # "Working on APIs? Try the Fetch MCP server for testing!"
```

### 🔒 **Automatic Security**
Commit hooks that prevent security issues automatically:
```bash
# This would be blocked automatically:
git commit -m "Add feature Co-Authored-By: SomeAI"
# ❌ COMMIT REJECTED: AI attributions not permitted
```

### ⚡ **Universal Development Tools**
Works with any technology stack:
```bash
make test    # Auto-detects: npm test, pytest, go test, cargo test
make lint    # Auto-detects: eslint, flake8, golangci-lint, clippy  
make format  # Auto-detects: prettier, black, go fmt, cargo fmt
```

### 📊 **AI Development Framework**
Complete documentation and context for AI-assisted development:
- **AI_DEVELOPMENT.md** - Comprehensive AI development guide
- **MCP_INTEGRATION.md** - MCP server documentation and examples
- **GIT_SECURITY_POLICIES.md** - Security policies and enforcement

## 🛠 Available Commands

### Essential Commands
```bash
make setup           # Complete environment setup
make health          # Check project status + get AI suggestions
make dev-start       # Start development with AI recommendations
make quality-check   # Comprehensive code quality validation
```

### AI & MCP Integration
```bash
make mcp-suggest     # Get context-aware MCP server recommendations
make mcp-setup       # Install and configure MCP servers
make ai-context      # Generate comprehensive AI context
```

### Security & Git
```bash
make setup-git-hooks    # Install security git hooks
make git-security-check # Verify security configuration
```

## 🎯 Supported Technologies

The platform automatically detects and supports:

| Technology | Package Manager | Linting | Formatting | Testing |
|------------|----------------|---------|------------|---------|
| **Node.js** | npm | eslint | prettier | npm test |
| **Python** | pip | flake8 | black | pytest |
| **Go** | go mod | golangci-lint | go fmt | go test |
| **Rust** | cargo | clippy | rustfmt | cargo test |

## 🤖 MCP Server Ecosystem

Get context-aware suggestions for powerful development tools:

### 🗄️ **Database Operations**
```bash
# When working with databases, get suggestions like:
"PostgreSQL MCP Server recommended for direct database queries"
```

### 🌐 **API Development**  
```bash
# When developing APIs, get suggestions like:
"Fetch MCP Server recommended for API testing and validation"
```

### 📁 **File Operations**
```bash
# When doing large codebase work, get suggestions like:
"Filesystem MCP Server recommended for bulk file operations"
```

## 🔒 Security Features

### Automatic Commit Validation
Prevents security issues before they happen:
- Blocks AI tool attributions in commits
- Validates commit message patterns
- Enforces security policies automatically

### Git Security Policies
- Comprehensive security documentation
- Automated enforcement
- Team-wide consistency

## 📚 Documentation

| File | Purpose |
|------|---------|
| **CLAUDE.md** | Project-specific AI development memory |
| **AI_DEVELOPMENT.md** | Complete AI development workflows |
| **MCP_INTEGRATION.md** | MCP server integration guide |
| **GIT_SECURITY_POLICIES.md** | Security policies and procedures |

## 🚀 Advanced Usage

### Context-Aware Development
The platform analyzes your current work and provides intelligent suggestions:

```bash
# Working in /backend/models/ directory?
"PostgreSQL MCP Server recommended - database operations detected"

# Working in /api/ directory?  
"Fetch MCP Server recommended - API development detected"

# Recent commits about testing?
"Testing-focused MCP servers recommended"
```

### AI-Enhanced Workflows
```bash
# Generate comprehensive project context for AI
make ai-context

# Get development status summary
make ai-status

# Generate documentation
make ai-docs
```

## 🔧 Customization

### Project-Specific Setup
1. **Update CLAUDE.md** - Add your project's specific context
2. **Customize .ai-context/** - Add project-specific AI context files  
3. **Modify .mcp/mcp-config.json** - Adjust MCP server recommendations

### Adding New Languages
1. **Edit Makefile** - Add detection and tool commands
2. **Update MCP configs** - Add language-specific suggestions
3. **Test integration** - Verify all commands work

## 🎯 Why This Boilerplate?

### Traditional Boilerplates
❌ Basic project structure  
❌ Manual tool setup  
❌ No AI integration  
❌ Generic documentation  

### Spec-Kit AI Development Platform
✅ **Intelligent automation** - Context-aware tool suggestions  
✅ **Built-in AI assistance** - MCP server ecosystem integration  
✅ **Security by default** - Automated policy enforcement  
✅ **Universal compatibility** - Works with any tech stack  
✅ **Zero configuration** - Everything works out of the box  

## 🤝 Contributing

This platform is designed to be extensible:

1. **Add new MCP servers** - Update `.mcp/mcp-config.json`
2. **Add language support** - Extend the Makefile detection logic
3. **Improve context rules** - Enhance `.mcp/recommendations/context-rules.json`
4. **Add security patterns** - Update `.githooks/commit-msg`

## 📄 License

MIT License - Use this platform for any project, commercial or personal.

---

**Made for developers who want AI-enhanced productivity without the complexity.**

🚀 **Get started in 30 seconds**: `git clone https://github.com/sreedeepnarayan/spec-dev-optimised.git && cd spec-dev-optimised && make setup`