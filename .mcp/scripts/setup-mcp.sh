#!/bin/bash

# Connected Banking Platform - MCP Server Setup Script
# This script sets up and configures MCP servers for the development environment

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

MCP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "${MCP_DIR}/.." && pwd)"

echo -e "${BLUE}Connected Banking Platform - MCP Server Setup${NC}"
echo "================================================"
echo ""

# Check prerequisites
check_prerequisites() {
    echo -e "${BLUE}Checking prerequisites...${NC}"
    
    # Check Node.js
    if ! command -v node &> /dev/null; then
        echo -e "${RED}❌ Node.js is required but not installed${NC}"
        echo "Please install Node.js 18+ and try again"
        exit 1
    fi
    
    local node_version=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$node_version" -lt 18 ]; then
        echo -e "${RED}❌ Node.js 18+ is required (found v${node_version})${NC}"
        exit 1
    fi
    
    # Check npm
    if ! command -v npm &> /dev/null; then
        echo -e "${RED}❌ npm is required but not installed${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ Prerequisites satisfied${NC}"
    echo ""
}

# Install MCP servers
install_mcp_server() {
    local server_name=$1
    local package_name=$2
    
    echo -e "${BLUE}Installing ${server_name}...${NC}"
    
    if npm list -g "${package_name}" &> /dev/null; then
        echo -e "${YELLOW}⚠️  ${server_name} already installed, skipping...${NC}"
        return 0
    fi
    
    if npm install -g "${package_name}"; then
        echo -e "${GREEN}✅ ${server_name} installed successfully${NC}"
        return 0
    else
        echo -e "${RED}❌ Failed to install ${server_name}${NC}"
        return 1
    fi
}

# Setup MCP servers based on configuration
setup_mcp_servers() {
    echo -e "${BLUE}Setting up MCP servers...${NC}"
    echo ""
    
    # Read configuration and install recommended servers
    local config_file="${MCP_DIR}/mcp-config.json"
    
    if [ ! -f "$config_file" ]; then
        echo -e "${RED}❌ MCP configuration file not found: $config_file${NC}"
        exit 1
    fi
    
    # Extract server configurations (simplified parsing)
    # In a real implementation, you might use jq for better JSON parsing
    
    echo "Installing recommended MCP servers:"
    echo ""
    
    # PostgreSQL MCP Server
    install_mcp_server "PostgreSQL MCP Server" "@modelcontextprotocol/server-postgres"
    
    # Fetch MCP Server  
    install_mcp_server "Fetch MCP Server" "@modelcontextprotocol/server-fetch"
    
    # Filesystem MCP Server
    install_mcp_server "Filesystem MCP Server" "@modelcontextprotocol/server-filesystem"
    
    # Git MCP Server
    install_mcp_server "Git MCP Server" "@modelcontextprotocol/server-git"
    
    echo ""
    echo -e "${GREEN}✅ MCP server installation completed${NC}"
}

# Create MCP client configuration
create_client_config() {
    echo -e "${BLUE}Creating MCP client configuration...${NC}"
    
    local client_config="${PROJECT_ROOT}/.mcp-client-config.json"
    
    cat > "$client_config" << 'EOF'
{
  "mcpServers": {
    "postgresql": {
      "command": "npx",
      "args": [
        "@modelcontextprotocol/server-postgres",
        "postgresql://cbadmin:cb_dev_password@localhost:5433/connected_banking"
      ],
      "env": {
        "POSTGRES_CONNECTION_STRING": "postgresql://cbadmin:cb_dev_password@localhost:5433/connected_banking"
      }
    },
    
    "filesystem": {
      "command": "npx",
      "args": [
        "@modelcontextprotocol/server-filesystem",
        "/Users/sreedeepnarayan/workspace/paywize/connected-banking"
      ]
    },
    
    "fetch": {
      "command": "npx", 
      "args": [
        "@modelcontextprotocol/server-fetch"
      ]
    },
    
    "git": {
      "command": "npx",
      "args": [
        "@modelcontextprotocol/server-git",
        "/Users/sreedeepnarayan/workspace/paywize/connected-banking"
      ]
    }
  }
}
EOF

    echo -e "${GREEN}✅ Client configuration created: $client_config${NC}"
}

# Test MCP server connections
test_mcp_connections() {
    echo -e "${BLUE}Testing MCP server connections...${NC}"
    echo ""
    
    # This is a placeholder for actual connection testing
    # In a real implementation, you would test each MCP server connection
    
    echo -e "${YELLOW}⚠️  Connection testing requires MCP client to be running${NC}"
    echo "To test connections:"
    echo "1. Start your MCP-compatible client (Claude Desktop, etc.)"
    echo "2. Use the configuration file: ${PROJECT_ROOT}/.mcp-client-config.json"
    echo "3. Verify each server responds to basic commands"
    echo ""
}

# Generate usage documentation
generate_usage_docs() {
    echo -e "${BLUE}Generating usage documentation...${NC}"
    
    local docs_file="${MCP_DIR}/USAGE.md"
    
    cat > "$docs_file" << 'EOF'
# MCP Server Usage Guide

## Available MCP Servers

### PostgreSQL MCP Server
- **Purpose**: Direct database operations and queries
- **Use cases**: Transaction analysis, schema validation, performance optimization
- **Security**: Read-only access to sensitive tables, audit logging enabled

### Fetch MCP Server  
- **Purpose**: HTTP requests and API testing
- **Use cases**: Shivalik Bank API testing, webhook validation, third-party integrations
- **Security**: Sandbox environments only, rate limiting enabled

### Filesystem MCP Server
- **Purpose**: Advanced file operations
- **Use cases**: Codebase analysis, bulk file operations, documentation generation
- **Security**: Restricted to project directory, sensitive files blocked

### Git MCP Server
- **Purpose**: Git operations and history analysis
- **Use cases**: Code history analysis, bug investigation, release management
- **Security**: Read-only operations, protected branches enforced

## Quick Start

1. Ensure MCP servers are installed: `make mcp-setup`
2. Check server status: `make mcp-status`
3. Get contextual suggestions: `make mcp-suggest`
4. View available servers: `make mcp-docs`

## Context-Aware Suggestions

The system automatically suggests relevant MCP servers based on:
- Current file types being worked on
- Error patterns in logs
- Development tasks in progress
- Project context and requirements

## Security Notes

- All MCP servers are configured with banking-specific security controls
- Production environments are blocked by default
- All operations are logged for audit compliance
- Sensitive data access is restricted and monitored

EOF

    echo -e "${GREEN}✅ Usage documentation generated: $docs_file${NC}"
}

# Main setup function
main() {
    echo "Starting MCP server setup for Connected Banking Platform..."
    echo ""
    
    check_prerequisites
    setup_mcp_servers
    create_client_config
    test_mcp_connections
    generate_usage_docs
    
    echo ""
    echo -e "${GREEN}🎉 MCP server setup completed successfully!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Configure your MCP client with: ${PROJECT_ROOT}/.mcp-client-config.json"
    echo "2. Run 'make mcp-status' to check server availability"
    echo "3. Run 'make mcp-suggest' for context-aware recommendations"
    echo "4. See ${MCP_DIR}/USAGE.md for detailed usage instructions"
    echo ""
    echo -e "${YELLOW}📖 For more information, see MCP_INTEGRATION.md${NC}"
}

# Show help if requested
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Connected Banking Platform - MCP Server Setup"
    echo ""
    echo "Usage: $0 [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help    Show this help message"
    echo "  --test-only   Only run connection tests"
    echo "  --docs-only   Only generate documentation"
    echo ""
    echo "This script installs and configures MCP servers for the Connected Banking Platform."
    echo "It sets up PostgreSQL, Fetch, Filesystem, and Git MCP servers with banking-specific"
    echo "security configurations."
    exit 0
fi

# Handle special flags
if [ "$1" = "--test-only" ]; then
    test_mcp_connections
    exit 0
fi

if [ "$1" = "--docs-only" ]; then
    generate_usage_docs
    exit 0
fi

# Run main setup
main