# Development Workflow - Connected Banking Platform

## Git Workflow Strategy

### Branch Structure
```
main (production)
├── develop (integration)
│   ├── feature/merchant-onboarding
│   ├── feature/shivalik-integration
│   ├── feature/wallet-management
│   ├── hotfix/auth-token-fix
│   └── release/v1.0.0
└── staging (pre-production testing)
```

### Branch Naming Conventions
- **Feature branches**: `feature/short-description`
- **Bug fixes**: `bugfix/issue-description`
- **Hotfixes**: `hotfix/critical-fix-description`
- **Release branches**: `release/v{major}.{minor}.{patch}`

### Commit Message Format
```
type(scope): brief description

Optional detailed explanation of changes.

- Specific change 1
- Specific change 2

Closes: #123
Co-authored-by: Name <email>
```

#### Commit Types
- **feat**: New feature implementation
- **fix**: Bug fix
- **docs**: Documentation updates
- **style**: Code formatting changes
- **refactor**: Code refactoring without functionality change
- **test**: Adding or updating tests
- **chore**: Maintenance tasks

## Development Environment Setup

### Prerequisites
```bash
# Required software
- Docker Desktop 4.0+
- Git 2.30+
- Node.js 18+ (for frontend development)
- Python 3.11+ (for backend development)
- Make utility

# Optional but recommended
- VS Code with extensions
- Postman for API testing
- DBeaver for database management
```

### Quick Start Process
```bash
# 1. Clone repository
git clone <repository-url>
cd connected-banking

# 2. Environment setup
cp .env.example .env
# Edit .env with your local settings

# 3. Start development environment
make setup          # One-time setup
make up             # Start all services
make health         # Verify all services

# 4. Access services
# Frontend: http://localhost:3000
# API Docs: http://localhost:8001/docs
# Grafana: http://localhost:3001 (admin/grafana_admin)
```

### Daily Development Workflow
```bash
# Morning routine
git pull develop                    # Get latest changes
make up                            # Start services
make health                        # Verify system health
make test                          # Run test suite

# During development
make logs-f                        # Monitor logs
make db-shell                      # Database access
make shell                         # Service shell access

# Before committing
make test                          # Full test suite
make lint                          # Code quality checks
make format                        # Auto-format code
```

## Code Review Process

### Review Checklist
#### Security Review
- [ ] Input validation for all user inputs
- [ ] SQL injection prevention
- [ ] XSS protection in frontend
- [ ] Authentication/authorization checks
- [ ] Sensitive data encryption
- [ ] No hardcoded secrets

#### Performance Review
- [ ] Database queries optimized
- [ ] API response times <500ms
- [ ] Proper caching implementation
- [ ] Memory usage reasonable
- [ ] No N+1 query problems

#### Code Quality Review
- [ ] Follows project conventions
- [ ] Proper error handling
- [ ] Comprehensive logging
- [ ] Code comments where needed
- [ ] Test coverage adequate
- [ ] Documentation updated

#### Business Logic Review
- [ ] Meets acceptance criteria
- [ ] Handles edge cases
- [ ] Follows business rules
- [ ] Financial calculations accurate
- [ ] Compliance requirements met

### Review Process Steps
1. **Self-Review**: Developer reviews own code
2. **Automated Checks**: CI pipeline validation
3. **Peer Review**: Minimum 1 reviewer for features, 2 for critical paths
4. **Security Review**: Required for authentication/payment code
5. **Final Approval**: Tech lead approval for major changes

## Testing Strategy

### Testing Pyramid
```
                    E2E Tests (10%)
                 ┌─────────────────┐
                 │ User Journeys   │
                 │ Critical Flows  │
                 └─────────────────┘
              Integration Tests (20%)
           ┌─────────────────────────┐
           │    API Endpoints        │
           │  Database Operations    │
           │  External Services      │
           └─────────────────────────┘
           Unit Tests (70%)
    ┌─────────────────────────────────┐
    │      Business Logic             │
    │    Utility Functions            │
    │    Component Testing            │
    └─────────────────────────────────┘
```

### Test Development Workflow
```bash
# Test-Driven Development (TDD) - MANDATORY
1. Write failing test
2. Run test to confirm failure
3. Implement minimal code to pass
4. Refactor while keeping tests green
5. Repeat for next requirement

# Running tests
make test-unit               # Unit tests only
make test-integration        # Integration tests
make test-e2e               # End-to-end tests
make test-coverage          # Coverage report
```

### Testing Standards
- **Unit Tests**: 80% minimum coverage for business logic
- **Integration Tests**: All API endpoints covered
- **E2E Tests**: Critical user journeys automated
- **Performance Tests**: Load testing for key operations

## Database Development

### Schema Changes Process
```bash
# 1. Plan migration
# Review existing schema, plan changes, identify impacts

# 2. Create migration
make db-revision msg="Add beneficiary categories"

# 3. Test migration
make db-reset                # Fresh database
make db-migrate             # Apply migration
# Test rollback capability

# 4. Update models
# Modify SQLAlchemy models to match schema

# 5. Update APIs
# Add/modify endpoints to handle new fields

# 6. Update tests
# Ensure all tests pass with schema changes
```

### Data Migration Best Practices
- **Backward Compatible**: New columns nullable initially
- **Rollback Ready**: Every migration must be reversible
- **Performance Tested**: Large table changes tested on staging
- **Data Integrity**: Foreign key constraints properly defined

## Deployment Pipeline

### CI/CD Workflow
```yaml
# .github/workflows/main.yml
on: [push, pull_request]

jobs:
  test:
    - Code quality checks (lint, format)
    - Security scanning
    - Unit and integration tests
    - Build verification
  
  deploy-staging:
    - Deploy to staging environment
    - Run smoke tests
    - Performance validation
  
  deploy-production:
    - Manual approval required
    - Blue-green deployment
    - Health checks
    - Rollback capability
```

### Environment Promotion
```
Developer Machine → Feature Branch → Develop Branch → Staging → Production
      ↓                    ↓              ↓            ↓         ↓
  Local Testing      Integration    Feature Testing  UAT     Live System
```

### Deployment Commands
```bash
# Staging deployment
make deploy-staging

# Production deployment
make deploy-production

# Rollback (if needed)
make rollback-production

# Health verification
make verify-deployment
```

## Quality Assurance

### Code Quality Gates
```bash
# Automated quality checks (pre-commit)
make lint                   # Linting (flake8, eslint)
make format                 # Formatting (black, prettier)
make security-scan          # Security vulnerability scan
make test                   # Full test suite
```

### Manual QA Process
1. **Feature Testing**: QA team validates functionality
2. **Regression Testing**: Existing features still work
3. **Performance Testing**: Response times within targets
4. **Security Testing**: Penetration testing for major releases
5. **User Acceptance Testing**: Product owner validation

### Definition of Done
- [ ] All acceptance criteria met
- [ ] Code review completed and approved
- [ ] Unit tests written and passing (80%+ coverage)
- [ ] Integration tests passing
- [ ] Documentation updated
- [ ] Security review completed (if applicable)
- [ ] Performance impact assessed
- [ ] QA testing completed
- [ ] Product owner approval received

## Monitoring & Debugging

### Development Monitoring
```bash
# Real-time monitoring
make logs-f                 # Follow all service logs
make logs auth             # Specific service logs
make health                # Service health check

# Database monitoring
make db-shell              # PostgreSQL access
\d+ transactions           # Table structure
SELECT COUNT(*) FROM merchants; # Data verification

# Cache monitoring
make redis-shell           # Redis CLI access
INFO memory                # Memory usage
KEYS session:*             # Session inspection
```

### Debugging Workflow
```bash
# 1. Reproduce issue
# Document exact steps, error messages, expected vs actual

# 2. Investigate logs
make logs banking | grep ERROR
make logs-f | grep "correlation_id"

# 3. Database investigation
make db-shell
SELECT * FROM transactions WHERE status = 'failed';

# 4. Test fix
# Implement fix, write test, verify resolution

# 5. Deploy and monitor
# Deploy fix, monitor for regression
```

### Performance Debugging
- **API Performance**: Check response times in Grafana
- **Database Performance**: Use EXPLAIN for slow queries
- **Memory Issues**: Monitor container stats with `docker stats`
- **Cache Performance**: Check Redis hit rates and memory usage

## Documentation Standards

### Required Documentation
1. **API Documentation**: Auto-generated from OpenAPI specs
2. **Code Comments**: Complex business logic explained
3. **README Files**: Each service has comprehensive README
4. **Architecture Decisions**: Major decisions recorded in ADRs
5. **Runbooks**: Operational procedures documented

### Documentation Workflow
```bash
# Update API documentation
# OpenAPI specs auto-generate docs at /docs

# Update service README
# Include setup, configuration, common tasks

# Architecture Decision Records
mkdir docs/adr
# Create ADR-001-service-architecture.md

# Operational runbooks
mkdir docs/runbooks
# Create troubleshooting guides
```

## Security Development Practices

### Security-First Development
- **Threat Modeling**: Consider security implications early
- **Secure Coding**: Follow OWASP guidelines
- **Input Validation**: Validate all user inputs
- **Output Encoding**: Prevent XSS attacks
- **Authentication**: Proper JWT implementation
- **Authorization**: RBAC for all operations

### Security Testing
```bash
# Security scanning
make security-scan          # Vulnerability scanning
make dependency-check       # Check for vulnerable dependencies

# Manual security review
# Focus on authentication, data handling, external APIs
```

### Compliance Requirements
- **PCI DSS**: Payment card data protection
- **Data Privacy**: Encrypt sensitive data
- **Audit Trail**: Log all financial operations
- **Access Control**: Principle of least privilege

## Troubleshooting Guide

### Common Issues
```bash
# Service won't start
docker-compose logs <service>    # Check service logs
make health                     # Verify dependencies

# Database connection issues
make db-shell                   # Test database connectivity
docker-compose restart postgres # Restart database

# Redis connection issues
make redis-shell               # Test Redis connectivity
docker-compose restart redis   # Restart Redis

# Frontend build issues
cd frontend && npm install     # Reinstall dependencies
cd frontend && npm run build   # Test build process
```

### Performance Issues
- **Slow API responses**: Check database queries, add indexes
- **High memory usage**: Review code for memory leaks
- **Database locks**: Check for long-running transactions
- **Cache misses**: Review cache strategy and TTL settings

### Development Best Practices
1. **Write tests first** (TDD mandatory)
2. **Commit frequently** with clear messages
3. **Review security implications** of all changes
4. **Monitor performance impact** of new features
5. **Update documentation** with code changes
6. **Use feature flags** for gradual rollouts
7. **Follow coding conventions** consistently

---
**Last Updated**: 2025-09-10  
**Workflow Version**: 1.0.0  
**Review Cycle**: Monthly or after major releases