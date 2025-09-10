#!/bin/bash

# Connected Banking Platform - MCP Server Status Checker
# This script checks the status and availability of MCP servers

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

MCP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo -e "${BLUE}Connected Banking Platform - MCP Server Status${NC}"
echo "=============================================="
echo ""

# Check if MCP server is installed
check_mcp_server() {
    local server_name=$1
    local package_name=$2
    
    echo -n "  ${server_name}: "
    
    if npm list -g "${package_name}" &> /dev/null; then
        local version=$(npm list -g "${package_name}" --depth=0 2>/dev/null | grep "${package_name}" | awk '{print $2}' || echo "unknown")
        echo -e "${GREEN}✅ Installed (${version})${NC}"
        return 0
    else
        echo -e "${RED}❌ Not installed${NC}"
        return 1
    fi
}

# Check Node.js and npm
check_prerequisites() {
    echo -e "${BLUE}Prerequisites:${NC}"
    
    if command -v node &> /dev/null; then
        local node_version=$(node --version)
        echo -e "  Node.js: ${GREEN}✅ ${node_version}${NC}"
    else
        echo -e "  Node.js: ${RED}❌ Not installed${NC}"
    fi
    
    if command -v npm &> /dev/null; then
        local npm_version=$(npm --version)
        echo -e "  npm: ${GREEN}✅ v${npm_version}${NC}"
    else
        echo -e "  npm: ${RED}❌ Not installed${NC}"
    fi
    
    echo ""
}

# Check MCP server installations
check_mcp_installations() {
    echo -e "${BLUE}MCP Server Installations:${NC}"
    
    local all_installed=true
    
    if ! check_mcp_server "PostgreSQL MCP" "@modelcontextprotocol/server-postgres"; then
        all_installed=false
    fi
    
    if ! check_mcp_server "Fetch MCP" "@modelcontextprotocol/server-fetch"; then
        all_installed=false
    fi
    
    if ! check_mcp_server "Filesystem MCP" "@modelcontextprotocol/server-filesystem"; then
        all_installed=false
    fi
    
    if ! check_mcp_server "Git MCP" "@modelcontextprotocol/server-git"; then
        all_installed=false
    fi
    
    # Check for optional servers
    echo ""
    echo -e "${BLUE}Optional MCP Servers:${NC}"
    
    check_mcp_server "Brave Search MCP" "@modelcontextprotocol/server-brave-search" || true
    
    echo ""
    
    if [ "$all_installed" = true ]; then
        echo -e "${GREEN}✅ All core MCP servers are installed${NC}"
    else
        echo -e "${YELLOW}⚠️  Some MCP servers are missing. Run 'make mcp-setup' to install them.${NC}"
    fi
    
    echo ""
}

# Check configuration files
check_configurations() {
    echo -e "${BLUE}Configuration Status:${NC}"
    
    local config_file="${MCP_DIR}/mcp-config.json"
    if [ -f "$config_file" ]; then
        echo -e "  Main config: ${GREEN}✅ Present${NC}"
    else
        echo -e "  Main config: ${RED}❌ Missing${NC}"
    fi
    
    local client_config="${MCP_DIR}/../.mcp-client-config.json"
    if [ -f "$client_config" ]; then
        echo -e "  Client config: ${GREEN}✅ Present${NC}"
    else
        echo -e "  Client config: ${RED}❌ Missing${NC}"
    fi
    
    # Check individual server configs
    local servers_dir="${MCP_DIR}/servers"
    if [ -d "$servers_dir" ]; then
        local server_count=$(find "$servers_dir" -name "*.json" | wc -l)
        echo -e "  Server configs: ${GREEN}✅ ${server_count} files${NC}"
    else
        echo -e "  Server configs: ${RED}❌ Directory missing${NC}"
    fi
    
    echo ""
}

# Check service dependencies
check_dependencies() {
    echo -e "${BLUE}Service Dependencies:${NC}"
    
    # Check PostgreSQL
    echo -n "  PostgreSQL: "
    if curl -s -f http://localhost:5433 > /dev/null 2>&1 || nc -z localhost 5433 2>/dev/null; then
        echo -e "${GREEN}✅ Accessible on port 5433${NC}"
    else
        echo -e "${YELLOW}⚠️  Not accessible (may be normal if not running)${NC}"
    fi
    
    # Check Redis
    echo -n "  Redis: "
    if nc -z localhost 6379 2>/dev/null; then
        echo -e "${GREEN}✅ Accessible on port 6379${NC}"
    else
        echo -e "${YELLOW}⚠️  Not accessible (may be normal if not running)${NC}"
    fi
    
    # Check API services
    echo -n "  API Services: "
    local api_services=0
    local running_services=0
    
    for port in 8001 8002 8003 8004; do
        api_services=$((api_services + 1))
        if curl -s -f http://localhost:$port/health > /dev/null 2>&1; then
            running_services=$((running_services + 1))
        fi
    done
    
    if [ $running_services -eq $api_services ]; then
        echo -e "${GREEN}✅ All services running (${running_services}/${api_services})${NC}"
    elif [ $running_services -gt 0 ]; then
        echo -e "${YELLOW}⚠️  Partial services running (${running_services}/${api_services})${NC}"
    else
        echo -e "${YELLOW}⚠️  No services running (may be normal if not started)${NC}"
    fi
    
    echo ""
}

# Check for context files
check_context_system() {
    echo -e "${BLUE}Context System:${NC}"
    
    local context_dir="${MCP_DIR}/context"
    if [ -d "$context_dir" ]; then
        echo -e "  Context directory: ${GREEN}✅ Present${NC}"
    else
        echo -e "  Context directory: ${RED}❌ Missing${NC}"
    fi
    
    local recommendations_dir="${MCP_DIR}/recommendations"
    if [ -d "$recommendations_dir" ]; then
        echo -e "  Recommendations: ${GREEN}✅ Present${NC}"
    else
        echo -e "  Recommendations: ${RED}❌ Missing${NC}"
    fi
    
    echo ""
}

# Generate status report
generate_status_report() {
    echo -e "${BLUE}Status Summary:${NC}"
    echo ""
    
    # Determine overall status
    local overall_status="good"
    
    # Check critical components
    if ! npm list -g "@modelcontextprotocol/server-postgres" &> /dev/null || \
       ! npm list -g "@modelcontextprotocol/server-fetch" &> /dev/null; then
        overall_status="warning"
    fi
    
    if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
        overall_status="error"
    fi
    
    case $overall_status in
        "good")
            echo -e "${GREEN}✅ MCP integration system is ready for use${NC}"
            echo ""
            echo "Next steps:"
            echo "• Configure your MCP client with the provided configuration"
            echo "• Run 'make mcp-suggest' for context-aware recommendations"
            echo "• Check MCP_INTEGRATION.md for usage examples"
            ;;
        "warning")
            echo -e "${YELLOW}⚠️  MCP integration system has some issues${NC}"
            echo ""
            echo "Recommended actions:"
            echo "• Run 'make mcp-setup' to install missing components"
            echo "• Check configuration files for completeness"
            echo "• Verify service dependencies are running"
            ;;
        "error")
            echo -e "${RED}❌ MCP integration system is not functional${NC}"
            echo ""
            echo "Required actions:"
            echo "• Install Node.js 18+ and npm"
            echo "• Run 'make mcp-setup' to install MCP servers"
            echo "• Check system prerequisites"
            ;;
    esac
    
    echo ""
}

# Show detailed help
show_help() {
    echo "Connected Banking Platform - MCP Server Status Checker"
    echo ""
    echo "Usage: $0 [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help      Show this help message"
    echo "  --quick         Show quick status only"
    echo "  --detailed      Show detailed diagnostic information"
    echo "  --json          Output status in JSON format"
    echo ""
    echo "This script checks the installation and configuration status of MCP servers"
    echo "for the Connected Banking Platform development environment."
    echo ""
}

# Quick status check
quick_status() {
    echo -e "${BLUE}Quick MCP Status Check:${NC}"
    echo ""
    
    local status="✅"
    local message="Ready"
    
    if ! command -v node &> /dev/null; then
        status="❌"
        message="Node.js not installed"
    elif ! npm list -g "@modelcontextprotocol/server-postgres" &> /dev/null; then
        status="⚠️"
        message="MCP servers not installed"
    elif [ ! -f "${MCP_DIR}/mcp-config.json" ]; then
        status="⚠️"
        message="Configuration incomplete"
    fi
    
    echo -e "Status: ${status} ${message}"
    echo ""
    
    if [ "$status" != "✅" ]; then
        echo "Run 'make mcp-status --detailed' for more information"
    fi
}

# Main function
main() {
    check_prerequisites
    check_mcp_installations
    check_configurations
    check_dependencies
    check_context_system
    generate_status_report
}

# Handle command line arguments
case "${1:-}" in
    -h|--help)
        show_help
        exit 0
        ;;
    --quick)
        quick_status
        exit 0
        ;;
    --detailed)
        echo -e "${BLUE}Detailed MCP Status Check${NC}"
        echo ""
        main
        exit 0
        ;;
    --json)
        echo "JSON output not implemented yet"
        exit 1
        ;;
    "")
        main
        ;;
    *)
        echo "Unknown option: $1"
        echo "Use --help for usage information"
        exit 1
        ;;
esac