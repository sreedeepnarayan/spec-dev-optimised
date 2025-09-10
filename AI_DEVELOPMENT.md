# AI Development Guide - Connected Banking Platform

## Subagent Strategy

### Core Philosophy
The Connected Banking Platform leverages AI agents for efficient, systematic development. This guide provides frameworks for using the Task tool effectively and maintaining high-quality code standards throughout the development lifecycle.

### Task Tool Usage Framework

#### When to Use Task Tool (MANDATORY)
1. **Multi-step Features** (3+ distinct operations)
2. **Cross-service Integration** (multiple microservices involved)
3. **Database Schema Changes** (models + migrations + API updates)
4. **Complete Feature Implementation** (backend + frontend + tests)
5. **User-provided Feature Lists** (comma-separated or numbered lists)
6. **Complex Bug Fixes** (investigation + fix + testing + documentation)

#### When NOT to Use Task Tool
1. **Single file edits** (simple configuration changes)
2. **Documentation updates** (README, comments)
3. **Trivial fixes** (typos, formatting)
4. **Simple questions** (code explanation, clarification)

### Task Breakdown Methodology

#### Feature Development Template
```
Feature: [Feature Name]
├── Analysis & Planning
│   ├── Understand requirements
│   ├── Review existing code
│   └── Identify dependencies
├── Backend Implementation
│   ├── Database schema changes
│   ├── API endpoint development
│   └── Business logic implementation
├── Frontend Implementation
│   ├── UI component development
│   ├── State management updates
│   └── API integration
├── Testing & Quality
│   ├── Unit tests
│   ├── Integration tests
│   └── E2E testing
└── Documentation & Deployment
    ├── API documentation
    ├── User documentation
    └── Deployment verification
```

#### Bug Fix Template
```
Bug Fix: [Issue Description]
├── Investigation
│   ├── Reproduce the issue
│   ├── Identify root cause
│   └── Assess impact scope
├── Solution Implementation
│   ├── Implement fix
│   ├── Add defensive measures
│   └── Update related code
├── Verification
│   ├── Test fix effectiveness
│   ├── Regression testing
│   └── Performance impact check
└── Documentation
    ├── Update troubleshooting docs
    ├── Add logging/monitoring
    └── Code comments
```

## Context Management

### Session Initialization Protocol
```bash
# 1. Check current state
git status
git log --oneline -10

# 2. Verify system health
make health

# 3. Review project context
cat CLAUDE.md | head -50
cat specs/plan.md | grep -A 10 "Phase 1"

# 4. Check current tasks
cat specs/tasks.md | grep -E "\[ \]|🔄"
```

### Context Preservation Best Practices
1. **Always start** by reading CLAUDE.md and constitution.md
2. **Document decisions** immediately in relevant files
3. **Update progress** in task tracking files
4. **Commit frequently** with descriptive messages
5. **End sessions** with status updates

### Cross-Session Continuity
- **Before Starting**: Review last 5 git commits
- **During Work**: Maintain running TODO in comments
- **After Completion**: Update relevant documentation
- **Context Handoff**: Create clear status summaries

## Command Reference

### Essential AI-Optimized Commands

#### Quick Development Commands
```bash
# Start development environment
make setup                    # Complete environment setup
make up                      # Start all services
make health                  # Verify all services healthy

# Development workflow
make dev-start               # Start with fresh logs
make dev-test                # Run full test suite
make dev-lint                # Code quality checks
make dev-format              # Auto-format all code

# Context gathering
make context-generate        # Generate current system context
make context-api             # Generate API documentation
make context-db              # Generate database schema docs
```

#### Service Management
```bash
# Individual service control
make service-restart auth    # Restart specific service
make service-logs core       # View service logs
make service-shell banking   # Access service shell

# Database operations
make db-backup               # Create database backup
make db-restore              # Restore from backup
make db-schema-export        # Export schema documentation
```

#### Testing & Quality
```bash
# Comprehensive testing
make test-unit               # Unit tests only
make test-integration        # Integration tests
make test-e2e               # End-to-end tests
make test-coverage          # Generate coverage report

# Code quality
make quality-check          # Run all quality checks
make security-scan          # Security vulnerability scan
make performance-test       # Performance benchmarks
```

### AI Context Commands
```bash
# Generate context for AI agents
make ai-context             # Generate comprehensive context
make ai-status              # Current development status
make ai-apis                # API endpoint documentation
make ai-models              # Database model documentation
make ai-tasks               # Current task breakdown

# MCP Server Integration
make mcp-setup              # Install and configure MCP servers
make mcp-status             # Check MCP server availability
make mcp-suggest            # Get context-aware MCP recommendations
make mcp-docs               # Generate MCP server documentation
```

## Workflow Templates

### New Feature Development
```yaml
1. Planning Phase:
   - Read CLAUDE.md for current context
   - Review specs/connected-banking-spec.md
   - Check constitution.md for constraints
   - Identify affected services

2. Analysis Phase:
   - Use Grep tool to find related code
   - Read existing models and APIs
   - Identify integration points
   - Plan database changes

3. Implementation Phase:
   - Create database migrations first
   - Implement backend APIs
   - Add comprehensive tests
   - Build frontend components
   - Update documentation

4. Testing Phase:
   - Unit tests for all new functions
   - Integration tests for APIs
   - E2E tests for user workflows
   - Performance testing

5. Deployment Phase:
   - Update API documentation
   - Deploy to staging
   - Run smoke tests
   - Update production
```

### Bug Investigation Workflow
```yaml
1. Reproduction:
   - Gather error logs and symptoms
   - Reproduce issue in development
   - Document exact steps
   - Identify error patterns

2. Analysis:
   - Use Grep to find related code
   - Check recent commits for changes
   - Review logs for error patterns
   - Identify root cause

3. Solution:
   - Implement targeted fix
   - Add defensive programming
   - Update error handling
   - Add logging/monitoring

4. Verification:
   - Test fix with original scenario
   - Run regression tests
   - Check for side effects
   - Validate in staging

5. Documentation:
   - Update troubleshooting docs
   - Add monitoring alerts
   - Document lessons learned
   - Update code comments
```

### Database Schema Changes
```yaml
1. Planning:
   - Review existing schema
   - Plan migration strategy
   - Identify breaking changes
   - Plan rollback strategy

2. Implementation:
   - Create Alembic migration
   - Update SQLAlchemy models
   - Update API serializers
   - Add validation logic

3. Testing:
   - Test migration up/down
   - Verify data integrity
   - Test API endpoints
   - Check performance impact

4. Documentation:
   - Update API documentation
   - Document schema changes
   - Update integration guides
   - Add monitoring for new tables
```

## MCP Server Integration

### Model Context Protocol (MCP) Enhancement
The Connected Banking Platform integrates MCP servers to provide AI agents with enhanced capabilities for database operations, API testing, file management, and repository analysis. This integration makes AI development more efficient and context-aware.

### Available MCP Servers

#### PostgreSQL MCP Server
- **Purpose**: Direct database operations and query analysis
- **Use Cases**: 
  - Transaction data analysis and reporting
  - Database schema validation and optimization
  - Performance tuning and slow query identification
  - Data integrity checks and audit trail analysis
- **Security**: Banking-compliant with audit logging, read-only sensitive table access
- **Trigger Contexts**: Working with models, migrations, database errors

#### Fetch MCP Server
- **Purpose**: HTTP requests and API integration testing
- **Use Cases**:
  - Shivalik Bank API testing and validation
  - Webhook endpoint testing and debugging
  - Third-party service integration verification
  - Load testing and performance validation
- **Security**: Sandbox-only environments, rate limiting, request logging
- **Trigger Contexts**: API development, service integration, HTTP errors

#### Filesystem MCP Server
- **Purpose**: Advanced file system operations and codebase analysis
- **Use Cases**:
  - Large-scale code refactoring operations
  - Project structure analysis and documentation
  - Configuration file management
  - Bulk file operations and pattern matching
- **Security**: Project directory restrictions, sensitive file exclusions
- **Trigger Contexts**: Refactoring tasks, documentation generation, bulk operations

#### Git MCP Server
- **Purpose**: Repository operations and code history analysis
- **Use Cases**:
  - Bug investigation and code archaeology
  - Release management and changelog generation
  - Code review assistance and change analysis
  - Audit trail and compliance reporting
- **Security**: Read-only operations, protected branch enforcement
- **Trigger Contexts**: Bug investigation, release management, code reviews

### Context-Aware Recommendations

#### Automatic MCP Suggestions
The system analyzes current context and automatically recommends relevant MCP servers:

```bash
# Get intelligent MCP server suggestions
make mcp-suggest
```

#### Context Analysis Factors
1. **Current Working Directory**: Backend work → database servers
2. **Recent File Changes**: API files → fetch server recommendations
3. **Git Activity**: Recent commits → relevant analysis servers
4. **Service Status**: Running services → testing capabilities
5. **Error Patterns**: Database errors → PostgreSQL server suggestions

#### Banking-Specific Context Rules
- **Transaction Processing**: PostgreSQL + Fetch servers for data and API validation
- **Payment Integration**: Fetch server for external API testing (sandbox only)
- **Compliance Auditing**: PostgreSQL + Git servers for audit trails
- **Performance Issues**: PostgreSQL server for query optimization
- **Security Reviews**: All servers with enhanced logging and restrictions

### MCP Integration Workflows

#### Database Development Workflow
```yaml
1. Context Detection:
   - Working with database models or migrations
   - System suggests PostgreSQL MCP server
   
2. Enhanced Capabilities:
   - Direct database query execution
   - Schema validation and constraint checking
   - Performance analysis and optimization
   - Data integrity verification
   
3. Banking Compliance:
   - All operations logged for audit
   - Sensitive data automatically masked
   - Read-only access to critical tables
```

#### API Development Workflow
```yaml
1. Context Detection:
   - Working with API endpoints or integrations
   - System suggests Fetch MCP server
   
2. Enhanced Capabilities:
   - Live API endpoint testing
   - Webhook payload validation
   - Third-party integration verification
   - Performance and load testing
   
3. Security Controls:
   - Sandbox environment restrictions
   - Rate limiting on external calls
   - Request/response logging
   - Production endpoint blocking
```

### MCP Usage Patterns

#### Feature Development with MCP
```
1. Start Development:
   - Run `make mcp-suggest` for context analysis
   - Configure recommended MCP servers
   
2. Backend Development:
   - Use PostgreSQL MCP for database operations
   - Test API endpoints with Fetch MCP
   
3. Integration Testing:
   - Validate external APIs with Fetch MCP
   - Check data consistency with PostgreSQL MCP
   
4. Performance Optimization:
   - Analyze slow queries with PostgreSQL MCP
   - Test API response times with Fetch MCP
```

#### Bug Investigation with MCP
```
1. Error Analysis:
   - System suggests relevant MCP servers based on error patterns
   - Use Git MCP to investigate when issues were introduced
   
2. Root Cause Analysis:
   - PostgreSQL MCP for database-related issues
   - Fetch MCP for API connectivity problems
   
3. Solution Validation:
   - Test fixes with appropriate MCP servers
   - Verify data integrity and API functionality
```

### Security and Compliance

#### Banking-Specific Security Controls
- **Audit Logging**: All MCP operations logged for regulatory compliance
- **Data Protection**: Automatic masking of sensitive financial data
- **Environment Isolation**: Production systems blocked from MCP access
- **Access Controls**: Role-based permissions for different MCP capabilities

#### Compliance Requirements
- **PCI DSS**: All payment data interactions comply with security standards
- **Banking Regulations**: Audit trails maintained for all database operations
- **Data Privacy**: Customer information protected through automatic masking
- **Change Management**: All MCP-assisted changes tracked and documented

## Agent Prompting

### Effective Prompt Structures

#### Feature Implementation Prompt
```
I need to implement [FEATURE_NAME] for the Connected Banking Platform.

Requirements:
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

Context:
- Current phase: [Phase info from README]
- Affected services: [List services]
- Integration points: [External APIs, etc.]

Please break this down into tasks and implement following our TDD approach 
from constitution.md. Make sure to update all relevant documentation.
```

#### Bug Fix Prompt
```
I'm encountering [BUG_DESCRIPTION] in the Connected Banking Platform.

Symptoms:
- [Error message or behavior]
- [Steps to reproduce]
- [Expected vs actual behavior]

Please investigate this issue by:
1. Examining the relevant code
2. Identifying the root cause
3. Implementing a comprehensive fix
4. Adding tests to prevent regression

Follow our security-first principles from constitution.md.
```

#### Code Review Prompt
```
Please review the following changes for the Connected Banking Platform:

[CODE_CHANGES]

Focus on:
- Compliance with constitution.md principles
- Security implications for financial data
- Performance impact on transaction processing
- Test coverage adequacy
- Documentation completeness

Provide specific recommendations for improvements.
```

### Specialized Prompts

#### Security Review
```
Please conduct a security review of [COMPONENT] focusing on:
- Authentication and authorization
- Data encryption and protection
- Input validation and sanitization
- SQL injection prevention
- XSS and CSRF protection
- PCI DSS compliance requirements

Reference our security standards in constitution.md.
```

#### Performance Optimization
```
Please analyze and optimize [COMPONENT] for performance:
- API response time targets (<500ms p95)
- Database query optimization
- Caching strategy improvements
- Memory usage optimization
- Concurrent request handling

Target our performance goals from specs/plan.md.
```

#### API Documentation
```
Please generate comprehensive API documentation for [ENDPOINTS]:
- OpenAPI specification updates
- Request/response examples
- Error code documentation
- Integration examples
- Rate limiting information

Follow our API design patterns from CLAUDE.md.
```

## Quality Assurance Framework

### Code Review Checklist
- [ ] Follows TDD principles (tests written first)
- [ ] Meets security requirements (encryption, auth)
- [ ] Adheres to performance targets (<500ms)
- [ ] Includes comprehensive error handling
- [ ] Updates relevant documentation
- [ ] Passes all quality gates (lint, format)

### Testing Strategy
```yaml
Unit Tests (80% coverage minimum):
  - All business logic functions
  - Authentication mechanisms
  - Fee calculation algorithms
  - Data validation logic

Integration Tests:
  - API endpoint functionality
  - Database operations
  - External service integrations
  - Webhook processing

End-to-End Tests:
  - Complete user journeys
  - Merchant onboarding flow
  - Transaction processing
  - Error handling scenarios
```

### Documentation Standards
- **API Documentation**: Auto-generated from OpenAPI specs
- **Code Comments**: Business logic explanation required
- **README Updates**: New features must update README
- **Architecture Decisions**: Document in constitution.md

## Monitoring & Observability

### Key Metrics to Track
```yaml
Performance Metrics:
  - API response times (p95 < 500ms)
  - Transaction processing time
  - Database query performance
  - Error rates by endpoint

Business Metrics:
  - Transaction success rate (>98%)
  - Merchant onboarding completion
  - Wallet funding frequency
  - Fee collection success

Technical Metrics:
  - Service availability (>99.9%)
  - Memory and CPU usage
  - Database connection pool
  - Cache hit rates
```

### Alerting Configuration
```yaml
Critical Alerts:
  - Transaction failure rate >5%
  - API response time >1 second
  - Service downtime
  - Security breach attempts

Warning Alerts:
  - High memory usage >80%
  - Database slow queries
  - Cache miss rate high
  - Unusual traffic patterns
```

## Best Practices Summary

### Development Principles
1. **Security First**: Every change must consider security implications
2. **Test Driven**: Write tests before implementation
3. **API First**: Design APIs before building features
4. **Documentation**: Update docs with every change
5. **Performance**: Always consider performance impact

### AI Agent Collaboration
1. **Use Task Tool** for complex, multi-step work
2. **Break down features** into manageable tasks
3. **Maintain context** across sessions
4. **Document decisions** immediately
5. **Update progress** regularly

### Code Quality
1. **Follow conventions** from CLAUDE.md
2. **Pass all gates**: linting, formatting, testing
3. **Review security** implications
4. **Optimize performance** for financial operations
5. **Maintain audit trail** for compliance

---

**Version**: 1.0.0  
**Last Updated**: 2025-09-10  
**Maintainer**: Development Team  
**Review Cycle**: Monthly or after major releases