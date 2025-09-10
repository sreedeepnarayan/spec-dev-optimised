#!/bin/bash

# Connected Banking Platform - Context-Aware MCP Suggestion System
# This script analyzes the current context and suggests relevant MCP servers

set -e

# Check if we have bash 4+ for associative arrays
if (( BASH_VERSINFO[0] < 4 )); then
    echo "Note: Advanced features require bash 4+. Using simplified mode."
    SIMPLE_MODE=true
else
    SIMPLE_MODE=false
fi

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

# Initialize context variables
suggested_servers=()
context_reasons=()
if [ "$SIMPLE_MODE" = false ]; then
    declare -A context_scores=()
fi

# Analyze current working directory context
analyze_directory_context() {
    local current_dir=$(pwd)
    local rel_dir=${current_dir#$PROJECT_ROOT/}
    
    echo -e "${CYAN}📁 Directory Context Analysis:${NC}"
    echo "Current directory: ${rel_dir:-project root}"
    echo ""
    
    # Backend development context
    if [[ "$current_dir" == *"/backend"* ]]; then
        suggest_server "postgresql" "Working in backend directory - database operations likely"
        suggest_server "fetch" "Backend development - API testing may be needed"
        if [ "$SIMPLE_MODE" = false ]; then
            context_scores["backend"]=3
        fi
    fi
    
    # Database-related directories
    if [[ "$current_dir" == *"/models"* ]] || [[ "$current_dir" == *"/database"* ]]; then
        suggest_server "postgresql" "Working with database models or migrations"
        context_scores["database"]=5
    fi
    
    # API development
    if [[ "$current_dir" == *"/api"* ]] || [[ "$current_dir" == *"/endpoints"* ]]; then
        suggest_server "fetch" "Working with API endpoints - testing capabilities helpful"
        suggest_server "postgresql" "API endpoints often require database queries"
        context_scores["api"]=4
    fi
    
    # Frontend development
    if [[ "$current_dir" == *"/frontend"* ]]; then
        suggest_server "fetch" "Frontend development - API integration testing useful"
        context_scores["frontend"]=2
    fi
    
    # Documentation or project root
    if [[ "$rel_dir" == "" ]] || [[ "$current_dir" == *"/docs"* ]]; then
        suggest_server "filesystem" "Project overview - file analysis capabilities helpful"
        suggest_server "git" "Documentation work - code history may be relevant"
        context_scores["documentation"]=1
    fi
}

# Analyze recent file modifications
analyze_recent_files() {
    echo -e "${CYAN}📝 Recent File Analysis:${NC}"
    
    # Find recently modified files (last 24 hours)
    local recent_files=$(find "$PROJECT_ROOT" -type f -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.sql" -mtime -1 2>/dev/null | head -10)
    
    if [ -z "$recent_files" ]; then
        echo "No recent file modifications found"
        return
    fi
    
    echo "Recently modified files:"
    echo "$recent_files" | sed 's|'"$PROJECT_ROOT"'/||g' | head -5
    echo ""
    
    # Analyze file types
    if echo "$recent_files" | grep -q "models/.*\.py"; then
        suggest_server "postgresql" "Recent database model changes detected"
        context_scores["database"]=$((${context_scores["database"]:-0} + 2))
    fi
    
    if echo "$recent_files" | grep -q "api/.*\.py\|endpoints/.*\.py"; then
        suggest_server "fetch" "Recent API endpoint modifications"
        suggest_server "postgresql" "API changes may require database testing"
        context_scores["api"]=$((${context_scores["api"]:-0} + 2))
    fi
    
    if echo "$recent_files" | grep -q "\.sql\|migration"; then
        suggest_server "postgresql" "Database migration or SQL file changes"
        context_scores["database"]=$((${context_scores["database"]:-0} + 3))
    fi
}

# Analyze git context
analyze_git_context() {
    echo -e "${CYAN}🔀 Git Context Analysis:${NC}"
    
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Not in a git repository"
        return
    fi
    
    # Check current branch
    local current_branch=$(git branch --show-current 2>/dev/null || echo "unknown")
    echo "Current branch: $current_branch"
    
    # Check recent commits
    local recent_commits=$(git log --oneline -5 2>/dev/null || echo "")
    if [ -n "$recent_commits" ]; then
        echo "Recent commits:"
        echo "$recent_commits" | sed 's/^/  /'
    fi
    echo ""
    
    # Analyze commit patterns
    if echo "$recent_commits" | grep -qi "database\|migration\|sql\|model"; then
        suggest_server "postgresql" "Recent database-related commits"
        context_scores["database"]=$((${context_scores["database"]:-0} + 1))
    fi
    
    if echo "$recent_commits" | grep -qi "api\|endpoint\|fetch\|request"; then
        suggest_server "fetch" "Recent API-related commits"
        context_scores["api"]=$((${context_scores["api"]:-0} + 1))
    fi
    
    # Check for uncommitted changes
    if ! git diff --quiet 2>/dev/null; then
        suggest_server "git" "Uncommitted changes present - git analysis helpful"
        context_scores["git"]=$((${context_scores["git"]:-0} + 1))
    fi
}

# Analyze running services
analyze_service_context() {
    echo -e "${CYAN}🚀 Service Context Analysis:${NC}"
    
    local running_services=()
    local service_issues=()
    
    # Check each service
    for service_port in "8001:Auth" "8002:Core" "8003:Banking" "8004:Wallet"; do
        local port=${service_port%:*}
        local name=${service_port#*:}
        
        if curl -s -f "http://localhost:$port/health" > /dev/null 2>&1; then
            running_services+=("$name")
        else
            service_issues+=("$name")
        fi
    done
    
    if [ ${#running_services[@]} -gt 0 ]; then
        echo "Running services: ${running_services[*]}"
        suggest_server "fetch" "Services running - API testing capabilities available"
        context_scores["api"]=$((${context_scores["api"]:-0} + 1))
    fi
    
    if [ ${#service_issues[@]} -gt 0 ]; then
        echo "Services with issues: ${service_issues[*]}"
        suggest_server "fetch" "Service issues detected - API testing may help debug"
    fi
    
    # Check database connectivity
    if nc -z localhost 5433 2>/dev/null; then
        echo "Database: Available on port 5433"
        suggest_server "postgresql" "Database accessible - direct queries possible"
        context_scores["database"]=$((${context_scores["database"]:-0} + 1))
    else
        echo "Database: Not accessible on port 5433"
    fi
    
    echo ""
}

# Analyze error logs
analyze_error_context() {
    echo -e "${CYAN}🚨 Error Context Analysis:${NC}"
    
    # Check for recent error logs (simplified approach)
    local log_files=("/tmp/banking-errors.log" "$PROJECT_ROOT/logs/error.log")
    local error_patterns_found=()
    
    for log_file in "${log_files[@]}"; do
        if [ -f "$log_file" ]; then
            # Look for recent errors (last 100 lines)
            local recent_errors=$(tail -100 "$log_file" 2>/dev/null | grep -i "error\|exception\|failed" | tail -5)
            
            if [ -n "$recent_errors" ]; then
                echo "Recent errors found in $log_file:"
                echo "$recent_errors" | sed 's/^/  /'
                
                # Analyze error patterns
                if echo "$recent_errors" | grep -qi "database\|sql\|connection.*postgres"; then
                    suggest_server "postgresql" "Database errors detected in logs"
                    error_patterns_found+=("database")
                fi
                
                if echo "$recent_errors" | grep -qi "http\|api\|request\|fetch\|connection.*refused"; then
                    suggest_server "fetch" "HTTP/API errors detected in logs"
                    error_patterns_found+=("api")
                fi
                
                if echo "$recent_errors" | grep -qi "git\|repository\|commit"; then
                    suggest_server "git" "Git-related errors detected"
                    error_patterns_found+=("git")
                fi
            fi
        fi
    done
    
    if [ ${#error_patterns_found[@]} -eq 0 ]; then
        echo "No recent error patterns detected"
    fi
    
    echo ""
}

# Suggest MCP server
suggest_server() {
    local server=$1
    local reason=$2
    
    # Avoid duplicates
    if [[ ! " ${suggested_servers[@]} " =~ " ${server} " ]]; then
        suggested_servers+=("$server")
        context_reasons+=("$reason")
    fi
}

# Generate context-aware recommendations
generate_recommendations() {
    echo -e "${PURPLE}🎯 Context-Aware MCP Recommendations:${NC}"
    echo ""
    
    if [ ${#suggested_servers[@]} -eq 0 ]; then
        echo "No specific MCP servers recommended based on current context"
        echo "All MCP servers are available for general use"
        return
    fi
    
    # Sort by context scores and relevance
    local -A server_priorities=(
        ["postgresql"]="🗄️  Database Operations"
        ["fetch"]="🌐 API Testing & Integration"
        ["filesystem"]="📁 File System Operations"
        ["git"]="🔀 Git Operations & History"
    )
    
    echo "Recommended MCP servers based on your current context:"
    echo ""
    
    local index=0
    for server in "${suggested_servers[@]}"; do
        local priority_icon="${server_priorities[$server]:-📄 General Purpose}"
        local reason="${context_reasons[$index]}"
        local score=${context_scores[${server/postgresql/database}]:-1}
        local score=${context_scores[${server/fetch/api}]:-$score}
        
        echo -e "${GREEN}▶ $priority_icon${NC}"
        echo "  Server: $server"
        echo "  Reason: $reason"
        echo "  Context relevance: $(printf '★%.0s' $(seq 1 $((score > 5 ? 5 : score))))$(printf '☆%.0s' $(seq $((score > 5 ? 5 : score + 1)) 5))"
        echo ""
        
        ((index++))
    done
}

# Show usage examples
show_usage_examples() {
    echo -e "${BLUE}💡 Usage Examples:${NC}"
    echo ""
    
    if [[ " ${suggested_servers[@]} " =~ " postgresql " ]]; then
        echo -e "${CYAN}PostgreSQL MCP Server Examples:${NC}"
        echo "• Analyze transaction success rates: 'Show transaction success rates by payment method'"
        echo "• Check database performance: 'Find slow queries in the transaction table'"
        echo "• Validate schema: 'Check for missing foreign key constraints'"
        echo ""
    fi
    
    if [[ " ${suggested_servers[@]} " =~ " fetch " ]]; then
        echo -e "${CYAN}Fetch MCP Server Examples:${NC}"
        echo "• Test API endpoints: 'Test the health endpoint of all services'"
        echo "• Debug webhooks: 'Send a test webhook payload to transaction status endpoint'"
        echo "• API integration: 'Test Shivalik Bank account balance API'"
        echo ""
    fi
    
    if [[ " ${suggested_servers[@]} " =~ " filesystem " ]]; then
        echo -e "${CYAN}Filesystem MCP Server Examples:${NC}"
        echo "• Code analysis: 'Find all API endpoint files and analyze their structure'"
        echo "• Documentation: 'Generate API documentation from endpoint files'"
        echo "• Refactoring: 'Find all references to a specific function across the codebase'"
        echo ""
    fi
    
    if [[ " ${suggested_servers[@]} " =~ " git " ]]; then
        echo -e "${CYAN}Git MCP Server Examples:${NC}"
        echo "• Bug investigation: 'When was the authentication bug introduced?'"
        echo "• Code history: 'Show the evolution of transaction processing code'"
        echo "• Release notes: 'Generate release notes for recent commits'"
        echo ""
    fi
}

# Show next steps
show_next_steps() {
    echo -e "${YELLOW}📋 Next Steps:${NC}"
    echo ""
    echo "1. Install MCP servers (if not already done):"
    echo "   ${CYAN}make mcp-setup${NC}"
    echo ""
    echo "2. Check installation status:"
    echo "   ${CYAN}make mcp-status${NC}"
    echo ""
    echo "3. Configure your MCP client:"
    echo "   Use the configuration file: ${CYAN}.mcp-client-config.json${NC}"
    echo ""
    echo "4. Start using MCP servers:"
    echo "   Open your MCP-compatible client and begin with the suggested servers"
    echo ""
    echo "5. Get help and documentation:"
    echo "   ${CYAN}make mcp-docs${NC} or see ${CYAN}MCP_INTEGRATION.md${NC}"
    echo ""
}

# Main analysis function
main() {
    echo "Analyzing current development context..."
    echo ""
    
    analyze_directory_context
    analyze_recent_files
    analyze_git_context
    analyze_service_context
    analyze_error_context
    
    generate_recommendations
    show_usage_examples
    show_next_steps
}

# Show help
show_help() {
    echo "Connected Banking Platform - Context-Aware MCP Suggestions"
    echo ""
    echo "Usage: $0 [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help        Show this help message"
    echo "  --context-only    Show context analysis only"
    echo "  --recommendations Show recommendations only" 
    echo "  --examples        Show usage examples only"
    echo ""
    echo "This script analyzes your current development context and suggests"
    echo "the most relevant MCP servers for your current task."
    echo ""
}

# Handle command line arguments
case "${1:-}" in
    -h|--help)
        show_help
        exit 0
        ;;
    --context-only)
        analyze_directory_context
        analyze_recent_files
        analyze_git_context
        analyze_service_context
        analyze_error_context
        ;;
    --recommendations)
        # Run analysis first (silent)
        analyze_directory_context > /dev/null 2>&1
        analyze_recent_files > /dev/null 2>&1
        analyze_git_context > /dev/null 2>&1
        analyze_service_context > /dev/null 2>&1
        analyze_error_context > /dev/null 2>&1
        generate_recommendations
        ;;
    --examples)
        # Assume all servers for examples
        suggested_servers=("postgresql" "fetch" "filesystem" "git")
        show_usage_examples
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