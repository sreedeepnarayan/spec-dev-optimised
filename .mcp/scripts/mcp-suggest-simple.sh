#!/bin/bash

# Connected Banking Platform - Simple MCP Suggestion System
# Compatible with all bash versions

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

MCP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "${MCP_DIR}/.." && pwd)"

echo -e "${BLUE}Connected Banking Platform - MCP Context Analyzer${NC}"
echo "================================================="
echo ""

# Initialize suggestion tracking
suggested_postgresql=false
suggested_fetch=false
suggested_filesystem=false
suggested_git=false

# Analyze current working directory context
analyze_context() {
    local current_dir=$(pwd)
    local rel_dir=${current_dir#$PROJECT_ROOT/}
    
    echo -e "${CYAN}📁 Current Context:${NC} ${rel_dir:-project root}"
    echo ""
    
    # Backend development context
    if [[ "$current_dir" == *"/backend"* ]] || [[ "$current_dir" == *"/models"* ]] || [[ "$current_dir" == *"/database"* ]]; then
        suggested_postgresql=true
        echo "• Database operations likely - PostgreSQL MCP server recommended"
    fi
    
    # API development
    if [[ "$current_dir" == *"/api"* ]] || [[ "$current_dir" == *"/endpoints"* ]] || [[ "$current_dir" == *"/backend"* ]]; then
        suggested_fetch=true
        echo "• API development/testing - Fetch MCP server recommended"
    fi
    
    # Frontend development
    if [[ "$current_dir" == *"/frontend"* ]]; then
        suggested_fetch=true
        echo "• Frontend development - Fetch MCP server useful for API integration"
    fi
    
    # Check recent files
    local recent_files=$(find "$PROJECT_ROOT" -type f \( -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.sql" \) -mtime -1 2>/dev/null | head -5)
    
    if [ -n "$recent_files" ]; then
        echo -e "\n${CYAN}📝 Recent Files:${NC}"
        echo "$recent_files" | sed 's|'"$PROJECT_ROOT"'/||g'
        
        if echo "$recent_files" | grep -q "models\|sql\|migration"; then
            suggested_postgresql=true
            echo "• Database-related changes detected"
        fi
        
        if echo "$recent_files" | grep -q "api\|endpoint"; then
            suggested_fetch=true
            echo "• API-related changes detected"
        fi
    fi
    
    # Check service status
    echo -e "\n${CYAN}🚀 Service Status:${NC}"
    local services_running=0
    for port in 8001 8002 8003 8004; do
        if curl -s -f "http://localhost:$port/health" > /dev/null 2>&1; then
            services_running=$((services_running + 1))
        fi
    done
    
    if [ $services_running -gt 0 ]; then
        echo "• $services_running services running - API testing available"
        suggested_fetch=true
    else
        echo "• Services not running - consider 'make up' first"
    fi
    
    # Check database
    if nc -z localhost 5433 2>/dev/null; then
        echo "• Database accessible - Direct queries possible"
        suggested_postgresql=true
    fi
}

# Generate recommendations
generate_recommendations() {
    echo -e "\n${PURPLE}🎯 Recommended MCP Servers:${NC}"
    echo ""
    
    local recommendations=0
    
    if [ "$suggested_postgresql" = true ]; then
        echo -e "${GREEN}▶ 🗄️  PostgreSQL MCP Server${NC}"
        echo "  Use for: Database queries, schema analysis, transaction debugging"
        echo "  Example: 'Show transaction success rates by payment method'"
        echo ""
        recommendations=$((recommendations + 1))
    fi
    
    if [ "$suggested_fetch" = true ]; then
        echo -e "${GREEN}▶ 🌐 Fetch MCP Server${NC}"
        echo "  Use for: API testing, endpoint validation, integration debugging"
        echo "  Example: 'Test the health endpoint of all services'"
        echo ""
        recommendations=$((recommendations + 1))
    fi
    
    if [ "$suggested_filesystem" = true ]; then
        echo -e "${GREEN}▶ 📁 Filesystem MCP Server${NC}"
        echo "  Use for: Code analysis, file operations, project navigation"
        echo "  Example: 'Find all API endpoint files'"
        echo ""
        recommendations=$((recommendations + 1))
    fi
    
    if [ "$suggested_git" = true ]; then
        echo -e "${GREEN}▶ 🔀 Git MCP Server${NC}"
        echo "  Use for: Code history, branch analysis, commit investigation"
        echo "  Example: 'When was the authentication bug introduced?'"
        echo ""
        recommendations=$((recommendations + 1))
    fi
    
    if [ $recommendations -eq 0 ]; then
        echo "No specific MCP recommendations for current context"
        echo "All MCP servers are available for general use"
    fi
}

# Show next steps
show_next_steps() {
    echo -e "${YELLOW}📋 Next Steps:${NC}"
    echo ""
    echo "1. Install MCP servers: ${CYAN}make mcp-setup${NC}"
    echo "2. Check status: ${CYAN}make mcp-status${NC}"
    echo "3. Get more suggestions: ${CYAN}make mcp-suggest${NC}"
    echo "4. View examples: ${CYAN}make mcp-examples${NC}"
    echo ""
}

# Main function
main() {
    analyze_context
    generate_recommendations
    show_next_steps
}

# Handle command line arguments
case "${1:-}" in
    --recommendations)
        analyze_context > /dev/null 2>&1
        generate_recommendations
        ;;
    --quick)
        analyze_context > /dev/null 2>&1
        if [ "$suggested_postgresql" = true ] || [ "$suggested_fetch" = true ]; then
            echo -e "${YELLOW}💡 MCP Servers recommended for your current context${NC}"
            [ "$suggested_postgresql" = true ] && echo "• PostgreSQL MCP Server"
            [ "$suggested_fetch" = true ] && echo "• Fetch MCP Server"
        else
            echo -e "${GREEN}No specific MCP suggestions for current context${NC}"
        fi
        ;;
    *)
        main
        ;;
esac