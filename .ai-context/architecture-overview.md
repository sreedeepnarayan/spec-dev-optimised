# Connected Banking Platform - Architecture Overview

## System Architecture

### High-Level Architecture
```
┌─────────────────────────────────────────────────────────────┐
│                        Client Layer                          │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   Web Portal    │  │   Mobile App    │  │   Admin UI   │ │
│  │  (React 18)     │  │   (Future)      │  │  (Future)    │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
                               │
┌─────────────────────────────────────────────────────────────┐
│                     API Gateway Layer                        │
│                     Kong (Port 8000)                         │
│              Rate Limiting • Authentication                   │
│               Load Balancing • Request Routing               │
└─────────────────────────────────────────────────────────────┘
                               │
┌─────────────────────────────────────────────────────────────┐
│                    Microservices Layer                       │
│ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌────── │
│ │ Auth Service │ │ Core Service │ │Banking Service│ │Wallet │
│ │  (Port 8001) │ │ (Port 8002)  │ │ (Port 8003)  │ │Service│
│ │              │ │              │ │              │ │(8004) │
│ │ • JWT Auth   │ │ • Merchants  │ │ • Shivalik   │ │• VAMS │
│ │ • RBAC       │ │ • KYC/KYB    │ │   Bank APIs  │ │• Fees │
│ │ • Sessions   │ │ • Onboarding │ │ • Transactions│ │• Funds│
│ └──────────────┘ └──────────────┘ └──────────────┘ └────── │
└─────────────────────────────────────────────────────────────┘
                               │
┌─────────────────────────────────────────────────────────────┐
│                      Data Layer                              │
│ ┌──────────────────┐           ┌──────────────────────────┐ │
│ │   PostgreSQL     │           │         Redis            │ │
│ │   (Port 5433)    │           │       (Port 6379)        │ │
│ │                  │           │                          │ │
│ │ • Merchants      │           │ • Sessions               │ │
│ │ • Transactions   │           │ • Cache                  │ │
│ │ • Virtual Wallets│           │ • Rate Limiting          │ │
│ │ • Bank Accounts  │           │ • Message Queue          │ │
│ │ • Audit Logs     │           │                          │ │
│ └──────────────────┘           └──────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

## Service Architecture Details

### Auth Service (Port 8001)
**Responsibility**: Authentication, authorization, and session management

#### Core Components
- **JWT Manager**: Token generation, validation, refresh
- **RBAC Engine**: Role-based access control
- **Session Store**: Redis-backed session management
- **Password Manager**: bcrypt hashing and validation
- **OTP Service**: Mobile verification integration

#### Key APIs
```
POST /api/v1/auth/register          # Merchant registration
POST /api/v1/auth/verify-otp        # Mobile OTP verification
POST /api/v1/auth/login             # JWT token generation
POST /api/v1/auth/refresh           # Token refresh
POST /api/v1/auth/logout            # Session termination
```

#### Dependencies
- PostgreSQL: User credentials and roles
- Redis: Session storage and OTP cache
- SMS Gateway: OTP delivery (Twilio/SNS)

### Core Service (Port 8002)
**Responsibility**: Merchant management, KYC/KYB, and onboarding

#### Core Components
- **Merchant Manager**: Business information and lifecycle
- **KYC Engine**: Aadhaar/PAN verification integration
- **KYB Engine**: Business document processing
- **Document Store**: Secure file storage (S3/MinIO)
- **Onboarding Workflow**: Multi-step verification process

#### Key APIs
```
GET /api/v1/merchants/profile       # Merchant profile
PUT /api/v1/merchants/update        # Profile updates
POST /api/v1/kyc/initiate           # Start KYC process
POST /api/v1/kyb/documents          # Business document upload
GET /api/v1/onboarding/status       # Onboarding progress
```

#### Dependencies
- Auth Service: Token validation
- External KYC APIs: Aadhaar, PAN verification
- Document Storage: File upload and retrieval
- Notification Service: Status updates

### Banking Service (Port 8003)
**Responsibility**: Bank integration and transaction processing

#### Core Components
- **Shivalik Bank Client**: OAuth 2.0 API integration
- **Transaction Engine**: IMPS/NEFT/RTGS processing
- **Fee Calculator**: Tiered fee computation
- **Webhook Handler**: Bank status updates
- **IRN Generator**: Unique transaction identifiers

#### Key APIs
```
POST /api/v1/banking/connect        # Connect bank account
GET /api/v1/banking/balance         # Real-time balance
POST /api/v1/banking/transaction    # Initiate payment
GET /api/v1/banking/status/{irn}    # Transaction status
POST /api/v1/banking/webhook        # Bank callbacks
```

#### Dependencies
- Shivalik Bank APIs: Account and transaction services
- Wallet Service: Fee deduction and management
- Notification Service: Status updates
- Audit Service: Transaction logging

### Wallet Service (Port 8004)
**Responsibility**: Virtual wallet operations and fee management

#### Core Components
- **VAMS Integration**: Shivalik Bank virtual account pool
- **Wallet Manager**: Balance and transaction history
- **Fee Engine**: Automatic fee deduction and reconciliation
- **Fund Manager**: Funding from connected bank accounts
- **Real-time Updates**: WebSocket connections for live data

#### Key APIs
```
POST /api/v1/wallet/assign          # Assign virtual account
GET /api/v1/wallet/balance          # Current balance
POST /api/v1/wallet/fund            # Fund from bank account
GET /api/v1/wallet/transactions     # Transaction history
POST /api/v1/wallet/fee/deduct      # Process fee charges
```

#### Dependencies
- Shivalik VAMS: Virtual account management
- Banking Service: Fund transfer processing
- Core Service: Merchant validation
- Real-time Service: WebSocket notifications

## Data Architecture

### Database Design
**Primary**: PostgreSQL 15 with read replicas for high availability

#### Core Tables
```sql
-- Merchants: Business entities
merchants (id, business_name, mobile, email, kyc_status, created_at)

-- Virtual Wallets: VAMS assigned accounts
virtual_wallets (id, merchant_id, wallet_id, account_number, balance)

-- Bank Accounts: Connected merchant accounts
bank_accounts (id, merchant_id, account_number, ifsc, is_connected)

-- Transactions: All payment operations
transactions (id, irn, merchant_id, amount, status, mode, created_at)

-- Beneficiaries: Payment recipients
beneficiaries (id, merchant_id, name, account_number, ifsc, verified)

-- Audit Logs: Compliance and security tracking
audit_logs (id, entity_type, entity_id, action, details, timestamp)
```

#### Relationships
- Merchants → Virtual Wallets (1:1)
- Merchants → Bank Accounts (1:many)
- Merchants → Transactions (1:many)
- Merchants → Beneficiaries (1:many)
- All entities → Audit Logs (1:many)

### Caching Strategy
**Redis**: Multi-database separation by service

#### Cache Distribution
- **Database 0**: Auth service (sessions, tokens)
- **Database 1**: Core service (merchant data, KYC status)
- **Database 2**: Banking service (balance cache, transaction status)
- **Database 3**: Wallet service (wallet balances, fee calculations)

#### Cache Policies
- **Sessions**: 15-minute TTL with sliding expiration
- **Balance Data**: 5-minute TTL with invalidation on updates
- **KYC Status**: 1-hour TTL with manual invalidation
- **Transaction Status**: 30-second TTL during processing

## Security Architecture

### Authentication Flow
```
1. User Registration → OTP Verification → JWT Token Generation
2. API Request → JWT Validation → RBAC Check → Service Access
3. Token Expiry → Refresh Token → New JWT → Continued Access
```

### Authorization Model
- **Roles**: merchant, admin, support, readonly
- **Permissions**: create, read, update, delete, approve
- **Resources**: transactions, wallets, merchants, beneficiaries

### Data Protection
- **At Rest**: PostgreSQL TDE, encrypted file storage
- **In Transit**: TLS 1.3 for all communications
- **API Security**: Rate limiting, input validation, CORS
- **Secrets**: Environment variables, no hardcoded credentials

## Integration Architecture

### External Service Integrations

#### Shivalik Bank APIs
```
OAuth 2.0 Authentication
├── Account Management: verification, balance inquiry
├── Transaction Services: IMPS, NEFT, RTGS initiation
├── Webhook Services: status updates, confirmations
└── VAMS Integration: virtual account pool management
```

#### KYC/KYB Services
```
Government APIs
├── Aadhaar Verification: UIDAI APIs
├── PAN Validation: Income Tax Department
├── GST Verification: GSTN APIs
└── Business Registration: MCA database lookup
```

#### Notification Services
```
Multi-channel Notifications
├── SMS: Twilio/AWS SNS for OTP and alerts
├── Email: SendGrid/AWS SES for confirmations
├── Push: Firebase for mobile notifications
└── In-app: WebSocket for real-time updates
```

## Monitoring & Observability

### Metrics Collection
```
Application Metrics (Prometheus)
├── API Performance: response times, error rates
├── Business Metrics: transaction volume, success rates
├── Technical Metrics: database performance, cache hit rates
└── Security Metrics: failed logins, suspicious activities
```

### Logging Strategy
```
Structured Logging (ELK Stack)
├── Application Logs: JSON format with correlation IDs
├── Access Logs: API requests and responses
├── Audit Logs: All financial operations
└── Error Logs: Exception details and stack traces
```

### Health Checks
- **Service Health**: Individual service /health endpoints
- **Dependency Health**: Database, Redis, external APIs
- **Business Health**: Transaction success rates, wallet balances
- **Infrastructure Health**: Container status, resource usage

## Scalability Design

### Horizontal Scaling
- **Stateless Services**: All services designed for horizontal scaling
- **Load Balancing**: Kong gateway with multiple service instances
- **Database Scaling**: Read replicas for reporting queries
- **Cache Scaling**: Redis cluster for high availability

### Performance Optimization
- **API Response**: <500ms target with query optimization
- **Database**: Connection pooling, prepared statements
- **Caching**: Multi-level caching strategy
- **CDN**: Static asset delivery optimization

## Disaster Recovery

### Backup Strategy
- **Database**: Daily full backups, continuous WAL archiving
- **Files**: S3 cross-region replication
- **Configuration**: Infrastructure as code in version control
- **Secrets**: Encrypted backup in secure storage

### Recovery Procedures
- **RTO**: 4 hours for full system recovery
- **RPO**: 1 hour maximum data loss
- **Failover**: Automated failover for critical services
- **Testing**: Monthly disaster recovery drills

---
**Last Updated**: 2025-09-10  
**Architecture Version**: 1.0.0  
**Next Review**: 2025-10-10