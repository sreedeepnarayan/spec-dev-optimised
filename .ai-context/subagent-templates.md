# AI Subagent Templates - Connected Banking Platform

## Template Usage Guidelines

### When to Use Templates
1. **Complex Feature Implementation** (3+ services involved)
2. **Cross-cutting Concerns** (security, performance, monitoring)
3. **Integration Development** (external APIs, webhooks)
4. **Database Schema Changes** (migrations + API updates)
5. **Bug Investigation** (multi-service debugging)

### Template Structure
Each template includes:
- **Context Setup**: Essential information gathering
- **Task Breakdown**: Systematic approach
- **Quality Gates**: Testing and validation
- **Documentation**: Required updates

## Feature Development Templates

### Template 1: New API Endpoint
```
PROMPT TEMPLATE: API Endpoint Implementation

I need to implement a new API endpoint for [FEATURE_NAME] in the Connected Banking Platform.

Requirements:
- Endpoint: [METHOD] /api/v1/[path]
- Purpose: [Brief description]
- Authentication: [Required/Optional]
- Input: [Request payload structure]
- Output: [Response structure]
- Business Rules: [Any specific validation or logic]

Context:
- Current phase: [Check README.md for current phase]
- Affected services: [List which services need changes]
- Related endpoints: [Any existing similar endpoints]

Please implement following our TDD approach from constitution.md:
1. Analyze existing code patterns
2. Design database changes if needed
3. Write tests first
4. Implement backend API
5. Update frontend if needed
6. Update API documentation
7. Test integration end-to-end

Focus on our security-first principles and performance targets.
```

### Template 2: Database Schema Enhancement
```
PROMPT TEMPLATE: Database Schema Changes

I need to modify the database schema for [FEATURE_NAME] in the Connected Banking Platform.

Schema Changes:
- Tables affected: [List tables]
- New tables: [If any]
- New columns: [List with types]
- Indexes needed: [For performance]
- Constraints: [Foreign keys, unique constraints]

Business Context:
- Purpose: [Why this change is needed]
- Data migration: [Existing data handling]
- Rollback strategy: [How to undo if needed]
- Performance impact: [Expected query changes]

Please implement following our database change workflow:
1. Review current schema
2. Plan migration strategy with rollback
3. Create Alembic migration
4. Update SQLAlchemy models
5. Update API serializers
6. Add validation logic
7. Write comprehensive tests
8. Document schema changes

Ensure compliance with our data protection standards from constitution.md.
```

### Template 3: External Service Integration
```
PROMPT TEMPLATE: External Service Integration

I need to integrate [SERVICE_NAME] with the Connected Banking Platform.

Integration Details:
- Service: [Name and purpose]
- Authentication: [API key, OAuth, etc.]
- Endpoints needed: [List required endpoints]
- Data flow: [Request/response patterns]
- Error handling: [How to handle failures]
- Rate limits: [If any]

Technical Requirements:
- Service location: [Which microservice should handle this]
- Caching strategy: [Response caching needs]
- Monitoring: [Health checks, metrics]
- Fallback behavior: [What happens if service is down]

Please implement following our integration patterns:
1. Set up API client with proper authentication
2. Implement retry logic with exponential backoff
3. Add circuit breaker for resilience
4. Create comprehensive error handling
5. Add request/response logging
6. Implement health checks
7. Write integration tests with mocks
8. Update monitoring and alerting

Follow our security and performance standards from constitution.md.
```

## Bug Fix Templates

### Template 4: Multi-Service Bug Investigation
```
PROMPT TEMPLATE: Bug Investigation and Fix

I'm encountering [BUG_DESCRIPTION] in the Connected Banking Platform.

Bug Details:
- Symptoms: [What users experience]
- Error messages: [Exact error text]
- Reproduction steps: [How to reproduce]
- Affected services: [Which services involved]
- Frequency: [How often it occurs]
- Impact: [Business impact]

Investigation Request:
Please investigate this issue systematically:
1. Examine logs from all affected services
2. Check database state and recent changes
3. Review recent commits for related changes
4. Identify root cause with evidence
5. Assess impact scope
6. Design comprehensive fix
7. Implement with proper testing
8. Add monitoring to prevent recurrence

Focus on our reliability and security standards. Ensure fix doesn't introduce new issues.
```

### Template 5: Performance Optimization
```
PROMPT TEMPLATE: Performance Issue Resolution

I'm experiencing performance issues with [COMPONENT/ENDPOINT] in the Connected Banking Platform.

Performance Issues:
- Component: [Specific area having issues]
- Current performance: [Response times, metrics]
- Target performance: [Desired improvements]
- Load conditions: [When issues occur]
- Business impact: [Effect on users]

Optimization Request:
Please analyze and optimize performance:
1. Profile current performance bottlenecks
2. Analyze database queries and indexes
3. Review caching strategy effectiveness
4. Check for N+1 queries or similar issues
5. Optimize code algorithms if needed
6. Implement performance improvements
7. Add monitoring for key metrics
8. Validate improvements with load testing

Target our performance standards: <500ms API response time (p95).
```

## Specialized Templates

### Template 6: Security Review and Hardening
```
PROMPT TEMPLATE: Security Review

I need a comprehensive security review of [COMPONENT] in the Connected Banking Platform.

Security Scope:
- Component: [Specific area to review]
- Threat model: [Known security concerns]
- Compliance: [PCI DSS, data privacy requirements]
- Recent changes: [Any new functionality]

Security Review Request:
Please conduct thorough security analysis:
1. Review authentication and authorization
2. Analyze input validation and sanitization
3. Check for SQL injection vulnerabilities
4. Verify XSS and CSRF protection
5. Review data encryption at rest and transit
6. Check for sensitive data exposure
7. Validate access control mechanisms
8. Test error handling for information leakage
9. Review logging for security events
10. Provide security hardening recommendations

Follow our security-first principles from constitution.md.
```

### Template 7: Data Migration
```
PROMPT TEMPLATE: Data Migration

I need to migrate data for [MIGRATION_PURPOSE] in the Connected Banking Platform.

Migration Details:
- Data source: [Current state]
- Data target: [Desired state]
- Volume: [Amount of data]
- Downtime constraints: [Acceptable downtime]
- Rollback requirements: [Rollback strategy]
- Data validation: [How to verify correctness]

Migration Request:
Please plan and implement data migration:
1. Analyze current data structure and quality
2. Design migration strategy with minimal downtime
3. Create backup strategy before migration
4. Write migration scripts with validation
5. Plan rollback procedures
6. Test migration on staging data
7. Implement monitoring during migration
8. Validate data integrity after migration
9. Document migration process

Ensure zero data loss and minimal service disruption.
```

### Template 8: API Documentation Update
```
PROMPT TEMPLATE: API Documentation

I need to update API documentation for [FEATURE/CHANGES] in the Connected Banking Platform.

Documentation Scope:
- New endpoints: [List new APIs]
- Modified endpoints: [List changed APIs]
- Deprecated endpoints: [List deprecated APIs]
- Authentication changes: [Any auth updates]
- Error codes: [New error responses]

Documentation Request:
Please update comprehensive API documentation:
1. Update OpenAPI specifications
2. Add request/response examples
3. Document error codes and messages
4. Update authentication requirements
5. Add integration examples
6. Update rate limiting information
7. Create migration guide for breaking changes
8. Test documentation with real examples
9. Update postman collections if available

Ensure documentation matches actual API behavior.
```

## Testing Templates

### Template 9: Comprehensive Testing Suite
```
PROMPT TEMPLATE: Testing Implementation

I need comprehensive tests for [FEATURE/COMPONENT] in the Connected Banking Platform.

Testing Scope:
- Component: [What to test]
- Test types: [Unit, integration, E2E]
- Coverage target: [80% minimum for business logic]
- Critical paths: [Most important functionality]
- Edge cases: [Known edge cases to test]

Testing Request:
Please implement comprehensive test suite:
1. Write unit tests for all business logic
2. Create integration tests for API endpoints
3. Add database operation tests
4. Implement end-to-end user journey tests
5. Add negative test cases and error scenarios
6. Create performance tests for critical paths
7. Add security tests for auth and validation
8. Generate test coverage report
9. Document testing strategy

Follow our TDD principles from constitution.md.
```

### Template 10: Load Testing
```
PROMPT TEMPLATE: Load Testing

I need to implement load testing for [COMPONENT/ENDPOINT] in the Connected Banking Platform.

Load Testing Scope:
- Target: [What to test]
- Expected load: [Concurrent users, requests/sec]
- Performance targets: [Response time, throughput]
- Test scenarios: [Different load patterns]
- Infrastructure: [Testing environment]

Load Testing Request:
Please design and implement load testing:
1. Analyze current performance baseline
2. Design realistic load testing scenarios
3. Set up load testing infrastructure
4. Create test data for realistic load
5. Implement gradual load increase tests
6. Monitor system behavior under load
7. Identify performance bottlenecks
8. Document performance characteristics
9. Provide optimization recommendations

Target our performance SLA: <500ms response time (p95).
```

## Deployment Templates

### Template 11: Deployment Pipeline
```
PROMPT TEMPLATE: Deployment Setup

I need to set up deployment pipeline for [ENVIRONMENT] in the Connected Banking Platform.

Deployment Scope:
- Environment: [Staging/Production]
- Services: [Which services to deploy]
- Infrastructure: [Docker, Kubernetes, etc.]
- Monitoring: [Health checks, metrics]
- Rollback: [Rollback strategy]

Deployment Request:
Please implement deployment pipeline:
1. Set up CI/CD pipeline configuration
2. Implement automated testing gates
3. Configure environment-specific settings
4. Set up health checks and monitoring
5. Implement blue-green deployment
6. Create rollback procedures
7. Add deployment verification tests
8. Document deployment process
9. Test deployment pipeline thoroughly

Ensure zero-downtime deployment capability.
```

### Template 12: Monitoring and Alerting
```
PROMPT TEMPLATE: Monitoring Setup

I need to implement monitoring and alerting for [COMPONENT] in the Connected Banking Platform.

Monitoring Scope:
- Component: [What to monitor]
- Metrics: [Key performance indicators]
- Alerts: [Critical alert conditions]
- Dashboards: [Visualization needs]
- Response procedures: [What to do when alerts fire]

Monitoring Request:
Please implement comprehensive monitoring:
1. Identify key metrics to track
2. Set up Prometheus metric collection
3. Create Grafana dashboards
4. Configure alert rules for critical conditions
5. Set up notification channels
6. Create runbooks for alert response
7. Test alert conditions and responses
8. Document monitoring strategy
9. Train team on monitoring tools

Focus on business-critical metrics and early warning systems.
```

## Usage Instructions

### How to Use Templates
1. **Select appropriate template** based on task complexity
2. **Fill in the placeholder values** with specific project details
3. **Add context from current project state** (check CLAUDE.md, constitution.md)
4. **Submit to AI agent** for systematic implementation
5. **Review and iterate** based on agent output

### Template Customization
- **Add project-specific requirements** to templates
- **Include current architecture context** from project files
- **Reference security and performance standards** from constitution.md
- **Adapt for current development phase** from README.md

### Quality Assurance
- **All templates enforce TDD** from constitution.md
- **Security considerations** are built into every template
- **Performance targets** are explicitly stated
- **Documentation requirements** are included
- **Testing standards** are enforced

---
**Last Updated**: 2025-09-10  
**Template Version**: 1.0.0  
**Usage**: Copy template, fill placeholders, submit to AI agent