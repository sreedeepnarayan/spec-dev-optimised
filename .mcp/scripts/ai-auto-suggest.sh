#!/bin/bash

# Unified AI Auto-Suggest Script
# Provides context-aware recommendations for both MCP servers and subagents
# Used automatically by all development commands

# Colors for output
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Configuration
QUICK_MODE=${1:-""}
CURRENT_DIR=$(pwd)
PROJECT_NAME="Connected Banking Platform"

# Detect current context
detect_context() {
    local context=""
    
    # Check current directory context
    if [[ "$CURRENT_DIR" == *"/backend"* ]]; then
        context="backend"
    elif [[ "$CURRENT_DIR" == *"/frontend"* ]]; then
        context="frontend"
    elif [[ "$CURRENT_DIR" == *"/database"* ]] || [[ "$CURRENT_DIR" == *"/migrations"* ]]; then
        context="database"
    else
        context="general"
    fi
    
    # Check recent git changes for additional context
    if git diff --name-only HEAD~1 2>/dev/null | grep -q "\.py$"; then
        context="${context},python"
    fi
    
    if git diff --name-only HEAD~1 2>/dev/null | grep -q "\.sql$\|migration"; then
        context="${context},database"
    fi
    
    if git diff --name-only HEAD~1 2>/dev/null | grep -q "api\|endpoint"; then
        context="${context},api"
    fi
    
    echo "$context"
}

# Get subagent recommendations based on context
recommend_subagents() {
    local context="$1"
    local recommendations=""
    
    echo -e "${PURPLE}🤖 Subagent Recommendations:${NC}"
    
    case "$context" in
        *"backend"*|*"api"*)
            echo -e "  • ${YELLOW}API Endpoint Development${NC} - Use for creating new banking/wallet endpoints"
            echo -e "  • ${YELLOW}External Service Integration${NC} - Use for Shivalik Bank API work"
            recommendations="api,integration"
            ;;
        *"database"*)
            echo -e "  • ${YELLOW}Database Migration${NC} - Use for schema changes and data migrations"
            echo -e "  • ${YELLOW}Data Analysis${NC} - Use for analyzing banking transaction patterns"
            recommendations="database,analysis"
            ;;
        *"frontend"*)
            echo -e "  • ${YELLOW}UI Component Development${NC} - Use for complex dashboard features"
            echo -e "  • ${YELLOW}User Flow Implementation${NC} - Use for merchant onboarding flows"
            recommendations="ui,userflow"
            ;;
        *)
            # General recommendations based on project phase
            echo -e "  • ${YELLOW}Feature Planning${NC} - Use for breaking down complex banking features"
            echo -e "  • ${YELLOW}Testing Strategy${NC} - Use for comprehensive test planning"
            recommendations="planning,testing"
            ;;
    esac
    
    # Always show if we're in banking domain
    echo -e "  • ${YELLOW}Banking Domain Expert${NC} - Use for complex financial logic"
    
    return 0
}

# Get MCP server recommendations based on context
recommend_mcp_servers() {
    local context="$1"
    
    echo -e "${BLUE}🔧 MCP Server Recommendations:${NC}"
    
    # Always recommend based on context
    case "$context" in
        *"database"*|*"backend"*)
            echo -e "  • ${GREEN}PostgreSQL MCP${NC} - Analyze queries, optimize schemas, validate migrations"
            echo -e "    Command: Use PostgreSQL MCP for database operations"
            ;;
        *"api"*|*"testing"*)
            echo -e "  • ${GREEN}Fetch MCP${NC} - Test API endpoints, validate responses, check integrations"
            echo -e "    Command: Use Fetch MCP for API testing"
            ;;
        *"frontend"*)
            echo -e "  • ${GREEN}Filesystem MCP${NC} - Analyze component structure, check imports"
            echo -e "    Command: Use Filesystem MCP for code analysis"
            ;;
    esac
    
    # Git MCP is useful for most development tasks
    echo -e "  • ${GREEN}Git MCP${NC} - Analyze recent changes, check code history, review commits"
    echo -e "    Command: Use Git MCP for repository analysis"
}

# Show contextual development tips
show_development_tips() {
    local context="$1"
    
    echo -e "${YELLOW}💡 Development Tips:${NC}"
    
    case "$context" in
        *"banking"*|*"api"*)
            echo -e "  • Consider transaction safety when working with financial operations"
            echo -e "  • Use TodoWrite tool to track complex multi-step banking implementations"
            echo -e "  • Test all banking endpoints with various scenarios (success/failure)"
            ;;
        *"database"*)
            echo -e "  • Run 'make db-backup' before major migrations"
            echo -e "  • Use PostgreSQL MCP to validate query performance"
            echo -e "  • Consider data integrity for financial transactions"
            ;;
        *)
            echo -e "  • Use 'make mcp-suggest' for detailed recommendations"
            echo -e "  • Break complex features into subagent tasks"
            echo -e "  • Follow the patterns in .ai-context/subagent-templates.md"
            ;;
    esac
}

# Main execution
main() {
    if [[ "$QUICK_MODE" == "--quick" ]]; then
        echo -e "${BLUE}💡 Quick AI Recommendations${NC}"
    else
        echo -e "${BLUE}🚀 AI Development Assistant - $PROJECT_NAME${NC}"
        echo "================================================="
    fi
    
    # Detect current context
    CONTEXT=$(detect_context)
    
    if [[ "$QUICK_MODE" != "--quiet" ]]; then
        echo ""
        
        # Show subagent recommendations
        recommend_subagents "$CONTEXT"
        echo ""
        
        # Show MCP server recommendations  
        recommend_mcp_servers "$CONTEXT"
        echo ""
        
        # Show contextual tips
        if [[ "$QUICK_MODE" != "--quick" ]]; then
            show_development_tips "$CONTEXT"
        fi
    fi
}

# Run if called directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi