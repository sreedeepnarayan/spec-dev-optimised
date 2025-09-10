# MCP Server Integration for Connected Banking Platform

## Overview

The Connected Banking Platform includes **automatic MCP (Model Context Protocol) server integration** to enhance AI-assisted development workflows. This system provides context-aware suggestions for the most relevant MCP servers based on your current development activities.

## 🚀 Automatic Features

### Context-Aware Suggestions
The system automatically analyzes your current context and suggests relevant MCP servers when you run:
- `make up` - Starting services
- `make health` - Checking service status
- Any development command

### What Gets Analyzed
- **Current directory** - Backend, frontend, database, etc.
- **Recent file changes** - Models, APIs, migrations, etc.
- **Running services** - Which services are healthy/unhealthy
- **Database status** - PostgreSQL connectivity
- **Git context** - Recent commits and branch status

## 📋 Available Commands

### Quick Start
```bash
# Get instant MCP recommendations for your current context
make mcp-suggest

# Quick recommendations only
make mcp-suggest-quick

# Setup MCP servers (one-time)
make mcp-setup

# Check MCP server status
make mcp-status

# View usage examples
make mcp-examples

# Generate documentation
make mcp-docs
```

### Automatic Integration
```bash
# These commands now include automatic MCP suggestions:
make up          # Start services + get MCP suggestions
make health      # Check health + get MCP suggestions
make setup       # Full setup including MCP servers
```

## 🔧 Available MCP Servers

### PostgreSQL MCP Server 🗄️
**Best for:** Database operations, schema analysis, transaction debugging
- Direct database queries and analysis
- Transaction success rate analysis
- Schema validation and optimization
- Audit log investigations

**Auto-suggested when:**
- Working in `/backend/`, `/models/`, or database directories
- Recent changes to database models or migrations
- Database is accessible on port 5433

### Fetch MCP Server 🌐
**Best for:** API testing, endpoint validation, integration debugging
- Test API endpoints across all services
- Webhook testing and validation
- Integration with external services (Shivalik Bank)
- API response analysis

**Auto-suggested when:**
- Working in `/api/`, `/endpoints/`, or `/frontend/` directories
- Services are running and healthy
- Recent changes to API files

### Filesystem MCP Server 📁
**Best for:** Code analysis, file operations, project navigation
- Large-scale codebase analysis
- File pattern matching and bulk operations
- Project structure investigation
- Cross-file dependency analysis

### Git MCP Server 🔀
**Best for:** Code history, branch analysis, commit investigation
- Bug introduction timeline analysis
- Code evolution tracking
- Release note generation
- Commit pattern analysis

## 💡 Usage Examples

### Database Analysis
```
"Show transaction success rates by payment method"
"Find slow queries in the transaction table"
"Check for missing foreign key constraints"
```

### API Testing
```
"Test the health endpoint of all services"
"Send a test webhook payload to transaction status endpoint"
"Test Shivalik Bank account balance API"
```

### Code Investigation
```
"When was the authentication bug introduced?"
"Find all API endpoint files and analyze their structure"
"Show the evolution of transaction processing code"
```

## 🛠 Configuration

### Banking-Specific Security
The MCP servers are configured with banking compliance in mind:
- **Read-only database access** for analysis
- **Sandbox API endpoints only** (no production)
- **Audit logging** for all operations
- **Rate limiting** to prevent abuse
- **Data masking** for sensitive information

### Customization
Edit `.mcp/mcp-config.json` to:
- Adjust server priorities
- Modify security constraints
- Add custom triggers
- Configure banking-specific settings

## 🔒 Security & Compliance

### Development Environment Only
- MCP servers only work in development/test environments
- Production database access is blocked
- All API calls are rate-limited and logged

### Banking Compliance
- **PCI DSS** considerations built-in
- **Data masking** for sensitive fields
- **Audit trails** for all operations
- **Role-based access** controls

## 🚀 Getting Started

### For New Repository Users
1. **Clone the repository**
2. **Run setup**: `make setup` (includes MCP setup automatically)
3. **Start development**: MCP suggestions appear automatically
4. **Use suggestions**: Install MCP client and follow recommendations

### For Existing Users
1. **Update MCP servers**: `make mcp-setup`
2. **Check status**: `make mcp-status`
3. **Get suggestions**: `make mcp-suggest`

## 📚 Additional Resources

- **MCP Official Documentation**: https://modelcontextprotocol.io/
- **Banking Platform Docs**: See `CLAUDE.md` for complete development guide
- **Troubleshooting**: Use `make mcp-status` for diagnostics

## 🤝 Contributing

To improve MCP integration:
1. **Add context rules**: Edit `.mcp/recommendations/context-rules.json`
2. **Suggest new servers**: Update `.mcp/mcp-config.json`
3. **Improve detection**: Modify `.mcp/scripts/mcp-suggest-simple.sh`

---

**Note**: MCP servers enhance development productivity but are optional. All development tasks can be completed without them using traditional tools.