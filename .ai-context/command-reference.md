# Command Reference - Connected Banking Platform

## Quick Start Commands

### Environment Management
```bash
# Initial setup (one-time)
make setup                  # Complete environment setup
cp .env.example .env        # Create environment file

# Daily development
make up                     # Start all services
make down                   # Stop all services
make restart               # Restart all services
make health                # Check service health
make clean                 # Clean containers and volumes
make reset                 # Complete reset (clean + build + up)
```

### Service Control
```bash
# Individual service management
make service-restart auth   # Restart specific service
make service-stop core     # Stop specific service
make service-start banking # Start specific service

# Build operations
make build                 # Build all images
make build-auth           # Build specific service
make build-frontend       # Build frontend only
```

## Development Commands

### Code Quality
```bash
# Testing
make test                  # Run all tests
make test-unit            # Unit tests only
make test-integration     # Integration tests only
make test-e2e            # End-to-end tests
make test-coverage       # Generate coverage report

# Code quality checks
make lint                 # Run linting (flake8, eslint)
make format              # Auto-format code (black, prettier)
make type-check          # Type checking (mypy, typescript)
make security-scan       # Security vulnerability scan
```

### Database Operations
```bash
# Schema management
make db-migrate          # Apply pending migrations
make db-rollback         # Rollback last migration
make db-revision         # Create new migration
make db-reset           # Reset database completely
make db-seed            # Load seed data

# Database access
make db-shell           # PostgreSQL shell
make db-backup          # Create database backup
make db-restore         # Restore from backup
make db-schema-export   # Export schema documentation
```

### Cache & Session Management
```bash
# Redis operations
make redis-shell        # Redis CLI access
make redis-flush        # Clear all cache
make redis-monitor      # Monitor Redis operations
make cache-stats        # Cache performance statistics
```

## Service Access Commands

### Shell Access
```bash
# Service shells
make shell              # Auth service bash shell
make shell-core         # Core service shell
make shell-banking      # Banking service shell
make shell-wallet       # Wallet service shell

# Frontend development
make frontend-shell     # Frontend container shell
make frontend-install   # Install npm dependencies
make frontend-build     # Build production frontend
```

### Log Management
```bash
# Log viewing
make logs               # View all service logs
make logs-f             # Follow all logs (live)
make logs-auth          # Auth service logs only
make logs-core          # Core service logs only
make logs-banking       # Banking service logs only
make logs-wallet        # Wallet service logs only
make logs-frontend      # Frontend logs only

# Log filtering
make logs-error         # Show only error logs
make logs-warn          # Show warning and error logs
make logs-last-hour     # Logs from last hour
```

## API Testing Commands

### Development API Testing
```bash
# API documentation
make api-docs           # Open API documentation
make api-test           # Run API test suite
make api-benchmark      # Performance benchmarks

# Service endpoints (local development)
curl http://localhost:8001/health    # Auth service health
curl http://localhost:8002/health    # Core service health
curl http://localhost:8003/health    # Banking service health
curl http://localhost:8004/health    # Wallet service health
```

### Authentication Testing
```bash
# Auth flow testing
make test-auth-register  # Test registration flow
make test-auth-login     # Test login flow
make test-auth-refresh   # Test token refresh
make test-auth-logout    # Test logout flow
```

## Monitoring & Debugging

### Health Checks
```bash
# System health
make health             # All services health check
make health-detailed    # Detailed health report
make health-external    # External service dependencies

# Performance monitoring
make metrics            # Current system metrics
make performance-check  # Performance validation
make load-test         # Run load tests
```

### Debugging Tools
```bash
# Debug mode
make debug-auth         # Start auth service in debug mode
make debug-core         # Start core service in debug mode
make debug-banking      # Start banking service in debug mode

# Profiling
make profile-memory     # Memory usage profiling
make profile-cpu        # CPU usage profiling
make profile-db         # Database performance profiling
```

## Development Workflows

### Feature Development
```bash
# Start new feature
git checkout develop
git pull origin develop
git checkout -b feature/new-feature
make up && make health

# Development cycle
make test               # Run tests
make lint              # Check code quality
git add . && git commit -m "feat: implement new feature"

# Before merge
make test-integration  # Full integration tests
make security-scan     # Security check
git push origin feature/new-feature
# Create pull request
```

### Bug Fix Workflow
```bash
# Investigate bug
make logs-error         # Check error logs
make db-shell          # Investigate data issues
make redis-shell       # Check cache issues

# Fix and test
make test              # Verify fix
make test-regression   # Ensure no regression
git commit -m "fix: resolve issue description"
```

## Database Commands

### Schema Management
```bash
# Migration workflow
make db-revision msg="Add new table"  # Create migration
make db-migrate                       # Apply migration
make db-test-rollback                # Test rollback
make db-validate                     # Validate schema

# Data operations
make db-seed-test       # Load test data
make db-seed-prod       # Load production seed data
make db-truncate        # Clear all data (development only)
```

### Database Inspection
```bash
# Connect to database
make db-shell

# Common queries (inside PostgreSQL shell)
\dt                     # List tables
\d+ merchants          # Describe table structure
\di                     # List indexes
\df                     # List functions

# Performance queries
SELECT * FROM pg_stat_activity;        # Active connections
SELECT * FROM pg_stat_user_tables;     # Table statistics
```

## AI Development Commands

### Context Generation
```bash
# Generate AI context
make ai-context         # Generate comprehensive context
make ai-status          # Current development status
make ai-apis            # API endpoint documentation
make ai-models          # Database model documentation
make ai-tasks           # Current task breakdown
```

### Documentation Generation
```bash
# Auto-generate documentation
make docs-generate      # Generate all documentation
make docs-api          # Generate API docs
make docs-db           # Generate database schema docs
make docs-deploy       # Generate deployment docs
```

## Production Commands

### Deployment
```bash
# Staging deployment
make deploy-staging     # Deploy to staging
make verify-staging     # Verify staging deployment
make test-staging       # Run staging tests

# Production deployment
make deploy-production  # Deploy to production
make verify-production  # Verify production deployment
make monitor-production # Monitor production health
```

### Backup & Recovery
```bash
# Backup operations
make backup-create      # Create full backup
make backup-db         # Database backup only
make backup-files      # File storage backup

# Recovery operations
make restore-latest    # Restore latest backup
make restore-point     # Restore to specific point
make verify-restore    # Verify restoration
```

## Troubleshooting Commands

### Common Issues
```bash
# Service startup issues
make diagnose          # Run full diagnostic
make fix-permissions   # Fix file permissions
make clean-cache       # Clear all caches
make rebuild           # Rebuild all containers

# Network issues
make network-reset     # Reset Docker networks
make network-inspect   # Inspect network configuration
make connectivity-test # Test service connectivity
```

### Performance Issues
```bash
# Performance analysis
make perf-analyze      # Analyze performance bottlenecks
make slow-queries      # Identify slow database queries
make memory-analysis   # Memory usage analysis
make cpu-analysis      # CPU usage analysis
```

## Utility Commands

### File Operations
```bash
# Log management
make logs-rotate       # Rotate log files
make logs-compress     # Compress old logs
make logs-cleanup      # Clean old log files

# Temporary file cleanup
make temp-cleanup      # Clean temporary files
make cache-cleanup     # Clean cache files
make container-cleanup # Clean unused containers
```

### Development Utilities
```bash
# Code generation
make generate-models   # Generate model boilerplate
make generate-api      # Generate API boilerplate
make generate-tests    # Generate test boilerplate

# Configuration
make config-validate   # Validate configuration
make config-template   # Generate config template
make env-check        # Check environment variables
```

## Environment Variables

### Required Environment Variables
```bash
# Database
DATABASE_URL=postgresql://cbadmin:password@localhost:5433/connected_banking
REDIS_URL=redis://localhost:6379/0

# JWT Configuration
JWT_SECRET_KEY=your-super-secret-jwt-key
JWT_ALGORITHM=HS256
JWT_ACCESS_TOKEN_EXPIRE_MINUTES=15

# External Services
SHIVALIK_BANK_API_URL=https://api-sandbox.shivalikbank.com
SHIVALIK_BANK_CLIENT_ID=your_client_id
SHIVALIK_BANK_CLIENT_SECRET=your_client_secret

# Monitoring
PROMETHEUS_ENDPOINT=http://localhost:9090
GRAFANA_ENDPOINT=http://localhost:3001
```

### Optional Environment Variables
```bash
# Development
DEBUG=true
LOG_LEVEL=DEBUG
ENVIRONMENT=development

# Testing
TEST_DATABASE_URL=postgresql://test:test@localhost:5433/test_db
COVERAGE_THRESHOLD=80

# Deployment
DEPLOYMENT_ENV=staging
HEALTH_CHECK_TIMEOUT=30
```

## Quick Reference

### Service Ports
- **Frontend**: 3000
- **Auth Service**: 8001
- **Core Service**: 8002
- **Banking Service**: 8003
- **Wallet Service**: 8004
- **API Gateway**: 8000
- **PostgreSQL**: 5433
- **Redis**: 6379
- **Prometheus**: 9090
- **Grafana**: 3001

### Key File Locations
- **Environment**: `.env`
- **Docker Compose**: `docker-compose.yml`
- **Makefile**: `Makefile`
- **API Docs**: `http://localhost:8001/docs`
- **Database Migrations**: `backend/alembic/versions/`
- **Frontend Source**: `frontend/src/`
- **Backend Source**: `backend/app/`

### Important URLs
- **Frontend**: http://localhost:3000
- **API Documentation**: http://localhost:8001/docs
- **Grafana Dashboard**: http://localhost:3001 (admin/grafana_admin)
- **Prometheus**: http://localhost:9090
- **API Gateway**: http://localhost:8000

---
**Last Updated**: 2025-09-10  
**Command Version**: 1.0.0  
**Platform**: macOS, Linux, Windows (WSL2)