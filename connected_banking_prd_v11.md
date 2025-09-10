# Connected Banking Product Deck
*Comprehensive Product Requirements Document with Detailed User Journeys*

---

## 1. Executive Summary

### Product Vision
Connected Banking is an integrated financial platform that enables merchants to seamlessly connect their Shivalik Bank accounts, manage payouts, and handle funds through a unified virtual wallet system. The platform serves as a comprehensive business banking hub that automates financial operations while providing intelligent insights and multi-bank capabilities.

### Key Value Propositions
- **Unified Banking Operations**: Single dashboard consolidating all banking activities across multiple accounts and institutions
- **Intelligent Virtual Wallet**: Dedicated wallet system with automated fee management and zero-cost funding from connected banks
- **Smart Transaction Processing**: AI-powered routing and optimization for maximum success rates and cost efficiency
- **Comprehensive Analytics**: Real-time insights with predictive capabilities for cash flow management and business intelligence
- **Streamlined Onboarding**: Self-service merchant activation with integrated KYC/KYB processes and instant go-live capability

### Target Market
- **Primary**: Small to Medium Enterprises (SMEs) with monthly transaction volumes between ₹10 lakh to ₹50 crore
- **Secondary**: Large enterprises requiring multi-bank connectivity and advanced treasury management
- **Tertiary**: Fintech companies seeking Banking-as-a-Service (BaaS) solutions

---

## 2. Detailed User Journey & Onboarding Flow

### 2.1 Complete Merchant Onboarding Experience

#### **Journey Overview**: New Business to Active Transactor (Total Time: 45-60 minutes)

**Step 1: Initial Registration (5 minutes)**
```
Landing Page → "Get Started" CTA → Mobile Number Entry → OTP Verification → 
Basic Business Details Form → Email Verification → Dashboard Access
```

**User Story**: 
*"As Rajesh, owner of ABC Textiles, I want to quickly register on the platform so I can start managing my business payments digitally."*

**Detailed Flow**:
1. **Landing Page Interaction**:
   - User sees value proposition: "Process payments 10x faster with 99.5% success rate"
   - Clicks "Start Free Trial" button
   - Enters mobile number: +91-9876543210

2. **OTP Verification**:
   - Receives SMS: "Your Paywize OTP is 123456. Valid for 10 minutes"
   - Enters OTP in 6-digit input field
   - System validates and proceeds to next step

3. **Basic Information Collection**:
   - Business Name: "ABC Textiles Private Limited"
   - Business Type: Dropdown (Proprietorship/Partnership/Private Limited/Public Limited)
   - Industry: Dropdown (Textiles/Manufacturing/Services/Retail/etc.)
   - Monthly Transaction Volume: Range selector (₹1-10L, ₹10-50L, ₹50L-5Cr, ₹5Cr+)
   - Primary Contact Email: rajesh@abctextiles.com

**Step 2: Know Your Customer (eKYC) Process (15 minutes)**
```
Document Upload Interface → Aadhaar Verification → PAN Verification → 
Face Verification → Document Review → KYC Completion Status
```

**Detailed Experience**:
1. **Document Upload Interface**:
   - Clear instructions with sample images
   - Drag-and-drop or camera capture options
   - Real-time image quality validation
   - Progress indicator showing completion percentage

2. **Aadhaar Verification Process**:
   - Input field: "1234 5678 9012 3456"
   - OTP sent to registered mobile: "Enter OTP sent to +91-98****3210"
   - Automatic data extraction: Name, Address, Date of Birth
   - Cross-verification with business registration details

3. **PAN Verification**:
   - PAN input: "ABCDE1234F"
   - Instant verification via Income Tax database
   - Name matching with Aadhaar details
   - Business entity validation for companies

4. **Face Verification (Liveness Check)**:
   - Camera access permission request
   - Live photo capture with movement instructions
   - AI-powered liveness detection
   - Face matching with Aadhaar photo

**Step 3: Know Your Business (eKYB) Process (20 minutes)**

**For Private Limited Companies**:
```
Certificate of Incorporation Upload → MOA/AOA Documents → 
Board Resolution → Director KYC → Bank Account Proof → 
GST Registration → Business Address Verification
```

**Detailed Flow**:
1. **Incorporation Documents**:
   - Certificate of Incorporation (PDF upload)
   - Memorandum and Articles of Association
   - Form INC-22A (Active Company Compliance Certificate)
   - Automatic CIN validation via MCA database

2. **Director Information**:
   - Director 1: Rajesh Kumar (DIN: 08123456)
     - PAN: ABCDE1234F
     - Aadhaar: 1234 5678 9012 3456
     - Address proof: Passport/Driving License
   - Repeat for all directors (max 15)

3. **Business Verification**:
   - GST Number: 07ABCDE1234F1Z5
   - Current Bank Account Details:
     - Account Number: 1234567890123456
     - IFSC: HDFC0001234
     - Bank: HDFC Bank, Connaught Place Branch
   - Business Address with GPS coordinates
   - Utility bill for address proof

**Step 4: Agreement Execution (5 minutes)**
```
Terms & Conditions Review → Service Agreement Display → 
Digital Signature Interface → e-Sign Completion → Legal Binding Confirmation
```

**e-Signature Process**:
1. **Agreement Preview**:
   - Pre-filled merchant details
   - Commercial terms clearly displayed
   - Service level agreements outlined
   - Liability and compliance clauses

2. **Digital Signature**:
   - Aadhaar-based e-Sign integration
   - OTP authentication for signature
   - Timestamp and digital certificate attachment
   - PDF generation with legal validity

**Step 5: Virtual Wallet Assignment (Instant)**
```
Wallet Creation → Virtual Account Generation → Welcome Dashboard → 
Quick Tutorial → First Transaction Setup
```

**System Process**:
1. **Automatic Wallet Assignment**:
   - Query Shivalik Bank VAMS for unassigned accounts
   - Random selection from available pool
   - Account format: 987654321012 (12-digit virtual account)
   - Wallet ID generation: VW_ABC_20250905_001

2. **Welcome Experience**:
   - Personalized dashboard with merchant name
   - Virtual wallet card display with masked account
   - Balance: ₹0.00 (with "Add Money" CTA)
   - Quick action buttons: Connect Bank, Add Beneficiary, Make Payment

### 2.2 Bank Connection Journey

#### **Shivalik Bank Integration Flow (10 minutes)**

**User Story**:
*"As Rajesh, I want to connect my Shivalik Bank account so I can make payments directly from my business current account and fund my virtual wallet at zero cost."*

**Detailed Step-by-Step Process**:

**Step 1: Bank Selection Interface**
```
Dashboard → "Connect Bank" → Bank List Display → 
Shivalik Bank Selection → Connection Instructions
```

**Visual Experience**:
- Bank logos in grid layout (3 columns on desktop, 1 on mobile)
- Shivalik Bank: "Most Popular" badge with green tick
- Other banks: "Coming Soon" with gray overlay
- Click on Shivalik Bank opens detailed information modal

**Step 2: Bank Account Details Entry**
```
Account Information Form → Validation → Consent → 
API Integration → Balance Verification → Connection Success
```

**Form Details**:
1. **Account Information**:
   - Account Holder Name: "ABC Textiles Private Limited" (pre-filled from business registration)
   - Account Number: 50100123456789 (16-digit input with masking)
   - Confirm Account Number: Re-entry for verification
   - IFSC Code: SIBL0000123 (auto-complete with branch details)
   - Account Type: Current Account (pre-selected for business)
   - Branch Name: Auto-populated from IFSC

2. **Validation Process**:
   - Real-time IFSC validation
   - Account number format checking
   - Name matching with business registration
   - Duplicate account prevention check

3. **Consent Management**:
   - Account aggregation consent form
   - Data sharing permissions
   - Transaction monitoring agreement
   - Digital consent with timestamp

**Step 3: API Integration & Verification**
```
Bank API Call → Authentication → Account Validation → 
Balance Fetch → Transaction History → Connection Confirmation
```

**Behind-the-Scenes Process**:
1. **API Authentication**:
   ```json
   {
     "clientId": "PAYWIZE_PROD_001",
     "clientSecret": "encrypted_secret_key",
     "accountNumber": "50100123456789",
     "ifsc": "SIBL0000123",
     "consentId": "CONS_ABC_20250905_001"
   }
   ```

2. **Account Verification Response**:
   ```json
   {
     "status": "success",
     "accountStatus": "active",
     "accountName": "ABC TEXTILES PRIVATE LIMITED",
     "availableBalance": 2847569.50,
     "lastTransactionDate": "2025-09-04T18:30:00Z",
     "accountType": "current"
   }
   ```

3. **Transaction History Fetch**:
   - Last 5 transactions display
   - Balance verification
   - Account activity status check

**Step 4: Connection Success Experience**
```
Success Animation → Bank Card Display → Balance Visibility → 
Quick Actions Menu → Tutorial Overlay → Dashboard Update
```

**Success Page Elements**:
- Green checkmark animation
- "Successfully connected!" message
- Bank card showing:
  - Shivalik Bank logo
  - Masked account: ****6789
  - Balance: ₹28,47,569.50
  - Last updated timestamp
- Quick actions: View Transactions, Make Payment, Fund Wallet

---

## 3. Core Features & Detailed User Experiences

### 3.1 Merchant Dashboard - Complete User Experience

#### **Dashboard Layout & Navigation**

**Main Dashboard Structure**:
```
Top Navigation: Logo | Dashboard | Transactions | Beneficiaries | Reports | Settings
Main Content: Summary Cards | Bank Accounts | Virtual Wallet | Recent Transactions | Insights
Side Panel: Quick Actions | Notifications | Help Center
```

**User Story**:
*"As Rajesh, I want to see all my banking information at a glance so I can make informed decisions about my business cash flow quickly."*

#### **Summary Cards Section (Top Row)**

**Card 1: Today's Overview**
```
┌─────────────────────────────────────┐
│ TODAY'S TRANSACTIONS                │
│                                     │
│ ₹5,67,890  ↗ 87 Successful         │
│ ₹12,340   ↘ 3 Failed               │
│                                     │
│ Success Rate: 96.7% ↑ 2.3%         │
└─────────────────────────────────────┘
```

**Interactive Elements**:
- Click on amounts for detailed transaction breakdown
- Hover shows hour-by-hour transaction pattern
- Success rate trend with 7-day comparison

**Card 2: Available Balances**
```
┌─────────────────────────────────────┐
│ AVAILABLE BALANCES                  │
│                                     │
│ 🏦 Shivalik Bank: ₹28,47,569       │
│ 💰 Virtual Wallet: ₹45,678         │
│                                     │
│ Total Accessible: ₹29,03,247       │
└─────────────────────────────────────┘
```

**Interactive Features**:
- Click bank name to view detailed bank page
- Wallet click opens quick fund/withdraw options
- Real-time balance updates every 30 seconds

**Card 3: Pending Actions**
```
┌─────────────────────────────────────┐
│ PENDING ACTIONS                     │
│                                     │
│ 🔄 3 Scheduled Payments Tomorrow    │
│ ⚠️ 1 Failed Payment Needs Review    │
│ 📋 2 Bulk Uploads Processing        │
│                                     │
│ Action Required: 6 items            │
└─────────────────────────────────────┘
```

**Action Items**:
- Click count numbers for detailed lists
- Priority-based color coding (red, yellow, green)
- One-click resolution options

#### **Bank Accounts Section**

**Shivalik Bank Card - Detailed View**:
```
┌─────────────────────────────────────────────────────────┐
│ 🏦 SHIVALIK BANK              [Connected ✅] [⚙️ Manage]│
│                                                         │
│ Account: ****6789              Balance: ₹28,47,569.50  │
│ IFSC: SIBL0000123             Updated: 2 mins ago      │
│                                                         │
│ Quick Actions:                                          │
│ [💸 Make Payment] [📊 View Transactions] [💰 Fund Wallet]│
│                                                         │
│ Last 24 hrs: ₹2,45,670 out | ₹1,89,450 in            │
│ Success Rate: 98.5% (47/47 transactions)               │
└─────────────────────────────────────────────────────────┘
```

**Interactive Elements**:
- **Balance hover**: Shows last update time and refresh option
- **Account number click**: Shows full number with copy option
- **Quick Actions**: 
  - Make Payment → Opens beneficiary selection
  - View Transactions → Bank-specific transaction page
  - Fund Wallet → Zero-cost transfer interface

**Adding New Bank Flow**:
```
"+ Add Bank Account" Button → Available Banks List → 
Coming Soon Banks Display → Notification Signup
```

#### **Virtual Wallet Section**

**Virtual Wallet Card Interface**:
```
┌─────────────────────────────────────────────────────────┐
│ 💰 VIRTUAL WALLET              [Active ✅] [📋 Details] │
│                                                         │
│ Virtual A/C: ****1012          Balance: ₹45,678.90     │
│ Wallet ID: VW_ABC_001          Fee Reserve: ₹12,340    │
│                                                         │
│ Actions:                                                │
│ [💳 Add Money] [📤 View Credits] [📥 View Debits]      │
│                                                         │
│ Today's Fee Deductions: ₹340 (28 transactions)         │
│ Estimated for Tomorrow: ₹420 (scheduled payments)      │
└─────────────────────────────────────────────────────────┘
```

**Add Money to Wallet Journey**:
```
Add Money Click → Funding Options → Bank Selection → 
Amount Entry → Transfer Initiation → Confirmation
```

**Detailed Add Money Flow**:

**Step 1: Funding Options**
```
┌─────────────────────────────────┐
│ FUND YOUR WALLET                │
│                                 │
│ Option 1: From Connected Bank   │
│ 🏦 Shivalik Bank ****6789      │
│ Fee: ₹0 (Recommended) ✅        │
│                                 │
│ Option 2: Manual Transfer       │
│ 💳 External Bank Account        │
│ Fee: ₹0 (Standard NEFT/IMPS)    │
│                                 │
│ Option 3: UPI Transfer          │
│ 📱 Scan QR Code                 │
│ Fee: ₹0 (UPI Standard)          │
└─────────────────────────────────┘
```

**Step 2: Amount Entry (Connected Bank Selected)**
```
┌─────────────────────────────────┐
│ TRANSFER FROM SHIVALIK BANK     │
│                                 │
│ From: ****6789                  │
│ Available: ₹28,47,569.50        │
│                                 │
│ Amount: ₹ [50,000]              │
│ Purpose: Wallet Top-up          │
│                                 │
│ Processing Time: Instant        │
│ Transfer Fee: ₹0                │
│                                 │
│ [Cancel] [Confirm Transfer]     │
└─────────────────────────────────┘
```

**Step 3: Transfer Confirmation**
```
Transfer Processing → Bank API Call → 
Balance Update → Confirmation Screen → Dashboard Refresh
```

#### **Smart Insights Panel**

**Transaction Success Analysis**:
```
┌─────────────────────────────────────────────────────────┐
│ 📊 SMART INSIGHTS - LAST 7 DAYS                       │
│                                                         │
│ Success Trends:                                         │
│ Mon: 98.2% | Tue: 97.8% | Wed: 99.1% | Thu: 98.5%     │
│ Fri: 96.8% | Sat: 99.3% | Sun: 98.9%                  │
│                                                         │
│ 💡 Insight: Friday afternoons show 2.5% lower success  │
│    Recommendation: Schedule bulk payments on weekends   │
│                                                         │
│ Best Performing Hours: 10 AM - 12 PM (99.4% success)   │
│ Avoid: 2 PM - 4 PM on Fridays (94.2% success)         │
└─────────────────────────────────────────────────────────┘
```

**Cash Flow Insights**:
```
┌─────────────────────────────────────────────────────────┐
│ 💰 CASH FLOW ANALYSIS                                  │
│                                                         │
│ This Month: ₹2,45,67,890 out | ₹1,89,34,560 in       │
│ Net Outflow: ₹56,33,330                               │
│                                                         │
│ 📈 Trend: 15% increase in outflows vs last month      │
│ 📊 Pattern: Peak outflows on 1st & 15th of month      │
│                                                         │
│ ⚠️ Alert: Current burn rate suggests balance will      │
│    reach critical level in 18 days                     │
│                                                         │
│ 💡 Suggestion: Consider scheduling receivables follow-up│
└─────────────────────────────────────────────────────────┘
```

### 3.2 Transaction Management - Complete User Experience

#### **Transaction Table Interface**

**User Story**:
*"As Rajesh, I need to track all my payments in detail so I can reconcile with my accounting system and identify any issues quickly."*

**Advanced Table View**:
```
┌───────────────────────────────────────────────────────────────────────────────┐
│ TRANSACTIONS                                    [📊 Export] [🔍 Filter] [⚙️ Columns]│
├───────────────────────────────────────────────────────────────────────────────┤
│ Date/Time        │IRN              │Type    │Mode │UTR            │Amount   │Status  │
├───────────────────────────────────────────────────────────────────────────────┤
│ 05-Sep 14:30:25 │PSBDEDDMMYY000145│Single  │IMPS │SIB250905143025│₹50,000  │✅Success│
│ 05-Sep 11:15:42 │PSBDEDDMMYY000144│Bulk    │NEFT │SIB250905111542│₹2,35,670│🔄Process│
│ 04-Sep 18:22:15 │PSBDEDDMMYY000143│Link    │RTGS │SIB250904182215│₹1,25,000│❌Failed │
│ 04-Sep 15:45:30 │PSBDEDDMMYY000142│Schedule│IMPS │SIB250904154530│₹75,000  │✅Success│
│ 04-Sep 12:30:18 │PSBDEDDMMYY000141│Single  │NEFT │SIB250904123018│₹25,500  │✅Success│
└───────────────────────────────────────────────────────────────────────────────┘
```

**Interactive Features**:
1. **Row Click**: Opens detailed transaction view
2. **Status Icons**: Color-coded with hover tooltips
3. **Sortable Columns**: Click headers to sort
4. **Filter Options**: Date range, status, amount range, type
5. **Export Options**: CSV, Excel, PDF formats

**Detailed Transaction View (Modal)**:
```
┌─────────────────────────────────────────────────────────┐
│ TRANSACTION DETAILS                              [❌ Close] │
├─────────────────────────────────────────────────────────┤
│ IRN: PSBDEDDMMYY000143                                      │
│ Status: ❌ Failed                                           │
│ Initiated: 04-Sep-2025 at 18:22:15                         │
│ Completed: 04-Sep-2025 at 18:23:45                         │
│                                                             │
│ PAYMENT DETAILS:                                            │
│ Amount: ₹1,25,000                                          │
│ Type: Payment Link                                          │
│ Mode: RTGS                                                  │
│ UTR: SIB250904182215                                        │
│                                                             │
│ BENEFICIARY:                                                │
│ Name: Kumar Electronics Ltd                                 │
│ Account: ****8765 (HDFC Bank)                              │
│ IFSC: HDFC0001234                                          │
│                                                             │
│ BANK DETAILS:                                               │
│ From Account: ****6789 (Shivalik Bank)                     │
│ Processing Bank: Shivalik Bank                              │
│                                                             │
│ FAILURE DETAILS:                                            │
│ Error Code: R03                                             │
│ Error Message: Account does not exist or is dormant        │
│ Bank Response: Invalid beneficiary account number          │
│                                                             │
│ FEE INFORMATION:                                            │
│ Transaction Fee: ₹10 (RTGS)                                │
│ Fee Status: Refunded to Virtual Wallet                     │
│                                                             │
│ ACTIONS:                                                    │
│ [🔄 Retry Payment] [✏️ Edit Beneficiary] [🔧 Contact Support]│
└─────────────────────────────────────────────────────────────┘
```

#### **Transaction Types - Detailed Flows**

**Single Transaction Journey**:
```
Dashboard → Make Payment → Select Beneficiary → 
Enter Amount → Choose Mode → Review → Confirm → Process
```

**Step-by-Step Single Transaction**:

**Step 1: Payment Initiation**
- Click "Make Payment" from dashboard or bank card
- Quick action or full navigation to payment page

**Step 2: Beneficiary Selection**
```
┌─────────────────────────────────────────────┐
│ SELECT BENEFICIARY                          │
├─────────────────────────────────────────────┤
│ 🔍 Search: [Kumar Electronics]             │
│                                             │
│ RECENT BENEFICIARIES:                       │
│ 👤 Kumar Electronics Ltd    Last: 2 days   │
│    ****8765 (HDFC Bank)     ₹1,25,000     │
│                                             │
│ 👤 Supplier ABC Pvt Ltd     Last: 1 week   │
│    ****1234 (ICICI Bank)    ₹50,000       │
│                                             │
│ [+ Add New Beneficiary]                     │
└─────────────────────────────────────────────┘
```

**Step 3: Payment Details**
```
┌─────────────────────────────────────────────┐
│ PAYMENT TO: Kumar Electronics Ltd           │
│ Account: ****8765 (HDFC Bank)              │
├─────────────────────────────────────────────┤
│ Amount: ₹ [1,25,000]                       │
│ Purpose: Invoice Payment                    │
│ Reference: INV-2025-0234                    │
│                                             │
│ PAYMENT MODE:                               │
│ ⚬ IMPS  (₹5 fee, Instant)     ✅ Selected  │
│ ⚬ NEFT  (₹3 fee, 2-4 hours)               │
│ ⚬ RTGS  (₹10 fee, 30 mins)                │
│                                             │
│ From Account: Shivalik Bank ****6789       │
│ Available Balance: ₹28,47,569.50           │
│ After Payment: ₹27,22,564.50              │
│                                             │
│ Fee Source: Virtual Wallet (₹45,678.90)    │
│ After Fee: ₹45,673.90                     │
│                                             │
│ [Back] [Review Payment]                     │
└─────────────────────────────────────────────┘
```

**Step 4: Review & Confirmation**
```
┌─────────────────────────────────────────────┐
│ REVIEW PAYMENT DETAILS                      │
├─────────────────────────────────────────────┤
│ Beneficiary: Kumar Electronics Ltd          │
│ Account: 1234567890128765 (HDFC Bank)      │
│ Amount: ₹1,25,000                          │
│ Mode: IMPS                                  │
│ Fee: ₹5 (from Virtual Wallet)              │
│ Reference: INV-2025-0234                    │
│                                             │
│ From: Shivalik Bank (****6789)             │
│ Processing Time: Instant                    │
│                                             │
│ ⚠️ Please verify all details carefully.     │
│    This action cannot be undone.           │
│                                             │
│ [Edit Details] [Confirm & Pay]              │
└─────────────────────────────────────────────┘
```

**Step 5: Processing & Confirmation**
```
Processing → Bank API → Fee Deduction → 
UTR Generation → Status Update → Confirmation Screen
```

**Bulk Transaction Journey**:

**Step 1: Bulk Upload Interface**
```
┌─────────────────────────────────────────────┐
│ BULK PAYMENT UPLOAD                         │
├─────────────────────────────────────────────┤
│ Step 1: Download Template                   │
│ [📄 Download Excel Template]               │
│                                             │
│ Step 2: Upload Filled File                  │
│ [📤 Choose File] bulk_payments.xlsx         │
│                                             │
│ Step 3: Validation Results                  │
│ ✅ 45 valid entries                        │
│ ❌ 3 errors found                          │
│                                             │
│ ERRORS:                                     │
│ Row 12: Invalid IFSC code                   │
│ Row 28: Amount exceeds limit                │
│ Row 35: Duplicate beneficiary               │
│                                             │
│ [Fix Errors] [Process Valid Entries]        │
└─────────────────────────────────────────────┘
```

**Bulk Payment Template Structure**:
```
| S.No | Beneficiary Name | Account Number | IFSC Code | Amount | Purpose | Reference |
|------|------------------|----------------|-----------|--------|---------|-----------|
| 1    | Kumar Electronics| 1234567890123  | HDFC0001  | 50000  | Payment | INV001    |
| 2    | ABC Suppliers    | 9876543210987  | ICIC0002  | 25000  | Payment | INV002    |
```

**Scheduled Payment Journey**:

**Step 1: Scheduling Interface**
```
┌─────────────────────────────────────────────┐
│ SCHEDULE PAYMENT                            │
├─────────────────────────────────────────────┤
│ Beneficiary: Kumar Electronics Ltd          │
│ Amount: ₹1,25,000                          │
│                                             │
│ SCHEDULE OPTIONS:                           │
│ ⚬ One-time: [Date Picker]                  │
│ ⚬ Weekly: Every [Monday ▼]                 │
│ ⚬ Monthly: On [15th ▼] of each month       │
│ ⚬ Custom: [Advanced Options]               │
│                                             │
│ Next Payment: 15-Sep-2025 at 10:00 AM      │
│                                             │
│ ⚠️ Ensure sufficient balance on due date    │
│                                             │
│ [Cancel] [Schedule Payment]                 │
└─────────────────────────────────────────────┘
```

**Payment Link Journey**:

**Step 1: Link Creation**
```
┌─────────────────────────────────────────────┐
│ CREATE PAYMENT LINK                         │
├─────────────────────────────────────────────┤
│ PAYMENT DETAILS:                            │
│ Amount: ₹ [75,000]                         │
│ Description: Invoice Payment - INV001       │
│ Invoice Number: INV-2025-0234               │
│ Due Date: [Date Picker]                     │
│                                             │
│ CUSTOMER DETAILS:                           │
│ Name: Ramesh Kumar                          │
│ Email: ramesh@customer.com                  │
│ Mobile: +91-9876543210                      │
│                                             │
│ LINK SETTINGS:                              │
│ Expiry: 7 days from creation                │
│ Payment Modes: Bank Transfer Only           │
│                                             │
│ [Preview Link] [Create & Send]              │
└─────────────────────────────────────────────┘
```

**Step 2: Link Preview**
```
Generated Link: https://pay.paywize.com/link/PL_ABC_20250905_001

Customer Experience Preview:
┌─────────────────────────────────────────────┐
│ PAYMENT REQUEST FROM ABC TEXTILES           │
├─────────────────────────────────────────────┤
│ Amount: ₹75,000                            │
│ Description: Invoice Payment - INV001       │
│ Invoice: INV-2025-0234                     │
│                                             │
│ BANK TRANSFER DETAILS:                      │
│ Beneficiary: ABC Textiles Pvt Ltd          │
│ Account: 987654321012 (Virtual Account)     │
│ IFSC: SIBL0000123                          │
│                                             │
│ Reference: Use INV-2025-0234                │
│                                             │
│ [Upload Payment Proof] [Mark as Paid]       │
└─────────────────────────────────────────────┘
```

### 3.3 Beneficiary Management - Complete User Experience

#### **Beneficiary Dashboard Overview**

**User Story**:
*"As Rajesh, I want to manage all my payment recipients efficiently so I can make payments quickly without entering details repeatedly."*

**Main Beneficiary Interface**:
```
┌───────────────────────────────────────────────────────────────────────────────┐
│ BENEFICIARY MANAGEMENT                    [+ Add Beneficiary] [📤 Import] [⚙️] │
├───────────────────────────────────────────────────────────────────────────────┤
│ Categories: [All (247)] [Customers (89)] [Vendors (142)] [Employees (16)]     │
├───────────────────────────────────────────────────────────────────────────────┤
│ Search: [🔍 Kumar Electronics]                           Sort: [Last Used ▼]  │
├───────────────────────────────────────────────────────────────────────────────┤
│ Nickname         │ Account Number  │ Bank & IFSC      │ Last Txn │ Actions    │
├───────────────────────────────────────────────────────────────────────────────┤
│ Kumar Electronics│ ****8765       │🏦 HDFC Bank     │ 2 days   │[💸][✏️][🗑️]│
│                  │                │ HDFC0001234      │ ₹1.25L   │            │
├───────────────────────────────────────────────────────────────────────────────┤
│ ABC Suppliers    │ ****1234       │🏦 ICICI Bank     │ 1 week   │[💸][✏️][🗑️]│
│                  │                │ ICIC0002345      │ ₹50K     │            │
├───────────────────────────────────────────────────────────────────────────────┤
│ Ravi - Salary    │ ****9876       │🏦 SBI           │ 1 month  │[💸][✏️][🗑️]│
│                  │                │ SBIN0003456      │ ₹85K     │            │
└───────────────────────────────────────────────────────────────────────────────┘
```

#### **Add Beneficiary Journey - Detailed Flow**

**User Story**:
*"As Rajesh, I want to add a new supplier to my beneficiary list so I can make regular payments to them without entering bank details each time."*

**Step 1: Beneficiary Category Selection**
```
Add Beneficiary Click → Category Selection → Form Display → 
Validation → Bank Verification → Success Confirmation
```

**Category Selection Interface**:
```
┌─────────────────────────────────────────────┐
│ SELECT BENEFICIARY TYPE                     │
├─────────────────────────────────────────────┤
│ 👥 CUSTOMER                                │
│ For payments from customers/clients          │
│ Example: Invoice collections, advances      │
│ [Select Customer]                           │
│                                             │
│ 🏭 VENDOR                                  │
│ For payments to suppliers/vendors           │
│ Example: Purchase payments, services        │
│ [Select Vendor] ✅                         │
│                                             │
│ 👤 EMPLOYEE                                │
│ For salary and employee payments            │
│ Example: Salaries, reimbursements          │
│ [Select Employee]                           │
└─────────────────────────────────────────────┘
```

**Step 2: Beneficiary Details Form (Vendor Selected)**
```
┌─────────────────────────────────────────────────────────┐
│ ADD VENDOR BENEFICIARY                                      │
├─────────────────────────────────────────────────────────┤
│ BENEFICIARY INFORMATION:                                    │
│ Full Name*: [Ramesh Trading Company]                       │
│ Category: Vendor (Raw Materials)                           │
│ Nickname*: [Ramesh Trading] (for quick search)            │
│                                                             │
│ BANK ACCOUNT DETAILS:                                       │
│ Account Number*: [1234567890123456]                        │
│ Confirm Account*: [1234567890123456]                       │
│ IFSC Code*: [HDFC0001234]                                  │
│ Bank Name: HDFC Bank (Auto-filled)                         │
│ Branch: Connaught Place, New Delhi (Auto-filled)           │
│                                                             │
│ ADDITIONAL INFORMATION:                                     │
│ Email: ramesh@trading.com (Optional)                        │
│ Mobile: +91-9876543210 (Optional)                          │
│ GST Number: 07ABCDE1234F1Z5 (Optional)                     │
│ Notes: Regular supplier for cotton fabrics                 │
│                                                             │
│ [Cancel] [Verify & Add Beneficiary]                        │
└─────────────────────────────────────────────────────────────┘
```

**Step 3: Bank Account Verification Process**
```
Form Submission → IFSC Validation → Name Verification → 
Account Status Check → Penny Drop Test → Verification Success
```

**Real-time Validation Display**:
```
┌─────────────────────────────────────────────┐
│ VERIFYING BANK ACCOUNT...                   │
├─────────────────────────────────────────────┤
│ ✅ IFSC Code validated                      │
│ ✅ Bank details fetched                     │
│ 🔄 Account holder name verification...      │
│ 🔄 Account status check...                  │
│ ⏳ Penny drop test initiated...             │
│                                             │
│ Please wait while we verify the account     │
│ This may take 30-60 seconds                 │
└─────────────────────────────────────────────┘
```

**Step 4: Verification Results**
```
┌─────────────────────────────────────────────┐
│ VERIFICATION COMPLETED ✅                   │
├─────────────────────────────────────────────┤
│ Account Holder: RAMESH TRADING COMPANY      │
│ Account Status: Active                      │
│ Bank Response: Account verified successfully │
│                                             │
│ Penny Drop: ₹1.00 sent successfully        │
│ Reference: PD_ABC_20250905_001              │
│                                             │
│ ✅ Beneficiary ready for transactions       │
│                                             │
│ [Add Another] [Make Payment Now] [Done]     │
└─────────────────────────────────────────────┘
```

#### **Beneficiary Management Actions**

**Edit Beneficiary Journey**:
```
┌─────────────────────────────────────────────┐
│ EDIT BENEFICIARY: Kumar Electronics         │
├─────────────────────────────────────────────┤
│ Current Details:                            │
│ Account: 1234567890128765                   │
│ IFSC: HDFC0001234                          │
│ Category: Vendor                            │
│ Last Payment: 2 days ago (₹1,25,000)      │
│                                             │
│ What would you like to update?              │
│ ⚬ Contact Information (Email/Mobile)       │
│ ⚬ Category/Nickname                        │
│ ⚬ Bank Account Details                      │
│ ⚬ Additional Notes                          │
│                                             │
│ ⚠️ Changing bank details requires re-       │
│    verification and affects pending         │
│    scheduled payments                       │
│                                             │
│ [Cancel] [Update Details]                   │
└─────────────────────────────────────────────┘
```

**Delete Beneficiary Confirmation**:
```
┌─────────────────────────────────────────────┐
│ DELETE BENEFICIARY                          │
├─────────────────────────────────────────────┤
│ Are you sure you want to delete:            │
│ Kumar Electronics (****8765)               │
│                                             │
│ ⚠️ WARNING:                                │
│ • 2 scheduled payments will be cancelled    │
│ • Transaction history will be preserved     │
│ • This action cannot be undone             │
│                                             │
│ Type "DELETE" to confirm: [_______]         │
│                                             │
│ [Cancel] [Delete Beneficiary]               │
└─────────────────────────────────────────────┘
```

### 3.4 Whitelisting Management - Complete User Experience

#### **Whitelisting Purpose & User Story**

**User Story**:
*"As Rajesh, I want to ensure that only my company's authorized bank accounts can fund my virtual wallet, maintaining security and compliance while preventing unauthorized funding."*

**Business Logic**:
- Virtual wallets can only be funded from pre-approved (whitelisted) accounts
- Non-whitelisted funding attempts are flagged for review
- Ensures compliance with company ownership requirements
- Prevents money laundering and unauthorized transactions

#### **Whitelisting Dashboard**

```
┌───────────────────────────────────────────────────────────────────────────────┐
│ WHITELISTED ACCOUNTS                      [+ Add Account] [📋 Pending] [⚙️]    │
├───────────────────────────────────────────────────────────────────────────────┤
│ Filter: [All (5)] [Active (4)] [Inactive (1)] [Pending Approval (0)]          │
├───────────────────────────────────────────────────────────────────────────────┤
│ Account Holder      │ Account Number │ Bank & IFSC      │ Last Fund │ Status   │
├───────────────────────────────────────────────────────────────────────────────┤
│ ABC Textiles Pvt Ltd│ ****6789      │🏦 Shivalik Bank │ Today     │✅ Active │
│                     │               │ SIBL0000123      │ ₹50,000   │          │
├───────────────────────────────────────────────────────────────────────────────┤
│ ABC Textiles Pvt Ltd│ ****4567      │🏦 HDFC Bank     │ 3 days    │✅ Active │
│                     │               │ HDFC0001234      │ ₹25,000   │          │
├───────────────────────────────────────────────────────────────────────────────┤
│ ABC Textiles Pvt Ltd│ ****8901      │🏦 ICICI Bank    │ 1 week    │❌ Inactive│
│                     │               │ ICIC0002345      │ ₹0        │          │
└───────────────────────────────────────────────────────────────────────────────┘
```

#### **Add Whitelisted Account Journey**

**Step 1: Account Addition Form**
```
Add Account Click → Business Validation → Account Form → 
Name Matching → Verification → Approval Process
```

**Account Details Form**:
```
┌─────────────────────────────────────────────────────────┐
│ ADD WHITELISTED ACCOUNT                                     │
├─────────────────────────────────────────────────────────┤
│ ACCOUNT HOLDER INFORMATION:                                 │
│ Account Holder Name*: ABC Textiles Private Limited          │
│ (Pre-filled from business registration)                     │
│                                                             │
│ BANK ACCOUNT DETAILS:                                       │
│ Account Number*: [1234567890123456]                        │
│ Confirm Account*: [1234567890123456]                       │
│ IFSC Code*: [ICIC0002345]                                  │
│ Bank Name: ICICI Bank (Auto-filled)                        │
│ Branch: CP Branch, New Delhi (Auto-filled)                 │
│                                                             │
│ ACCOUNT PURPOSE:                                            │
│ ⚬ Primary Operating Account (Main business account)        │
│ ⚬ Secondary Current Account (Additional operations)        │
│ ⚬ Savings Account (Temporary funding)                      │
│ ⚬ FD/RD Account (Investment liquidation)                   │
│                                                             │
│ FUNDING LIMITS:                                             │
│ Daily Limit: ₹[5,00,000] (Maximum allowed)                │
│ Monthly Limit: ₹[1,00,00,000] (System default)            │
│                                                             │
│ [Cancel] [Verify & Add Account]                             │
└─────────────────────────────────────────────────────────────┘
```

**Step 2: Name Matching & Verification**
```
Form Submission → Business Name Validation → 
Account Ownership Verification → Compliance Check → Admin Approval
```

**Verification Process Display**:
```
┌─────────────────────────────────────────────┐
│ ACCOUNT VERIFICATION IN PROGRESS            │
├─────────────────────────────────────────────┤
│ Stage 1: Bank Details Validation            │
│ ✅ IFSC verified: ICIC0002345               │
│ ✅ Bank: ICICI Bank, CP Branch              │
│                                             │
│ Stage 2: Account Holder Verification        │
│ 🔄 Checking account holder name...          │
│ Expected: ABC TEXTILES PRIVATE LIMITED      │
│ Bank Response: ABC TEXTILES PVT LTD         │
│ ✅ Name match confirmed (variation accepted)│
│                                             │
│ Stage 3: Ownership Verification             │
│ 🔄 Cross-checking with business documents...│
│ ✅ Account ownership verified               │
│                                             │
│ Stage 4: Compliance Check                   │
│ ✅ AML screening passed                     │
│ ✅ No sanctions list matches               │
│                                             │
│ Status: Pending Admin Approval              │
│ Expected approval: Within 2-4 hours         │
└─────────────────────────────────────────────┘
```

**Step 3: Admin Approval Process (Backend)**
```
Verification Complete → Admin Notification → Manual Review → 
Document Cross-Check → Risk Assessment → Approval/Rejection
```

**Admin Review Interface** (Internal):
```
┌─────────────────────────────────────────────┐
│ WHITELIST APPROVAL REQUEST                  │
├─────────────────────────────────────────────┤
│ Merchant: ABC Textiles Pvt Ltd              │
│ Request Date: 05-Sep-2025 14:30            │
│                                             │
│ ACCOUNT DETAILS:                            │
│ Holder: ABC TEXTILES PVT LTD                │
│ Account: 1234567890123456                   │
│ Bank: ICICI Bank, CP Branch                 │
│                                             │
│ VERIFICATION STATUS:                        │
│ ✅ Name matching (95% confidence)           │
│ ✅ Account active and operational           │
│ ✅ No adverse database entries              │
│                                             │
│ RISK ASSESSMENT:                            │
│ Risk Level: Low                             │
│ Merchant Tier: Standard                     │
│ Previous Violations: None                   │
│                                             │
│ [Reject] [Request Documents] [Approve]      │
└─────────────────────────────────────────────┘
```

**Step 4: Approval Notification**
```
┌─────────────────────────────────────────────┐
│ ACCOUNT APPROVED ✅                         │
├─────────────────────────────────────────────┤
│ Your whitelisted account has been approved: │
│                                             │
│ ABC Textiles Pvt Ltd                        │
│ ICICI Bank - ****3456                       │
│ Daily Limit: ₹5,00,000                     │
│                                             │
│ This account can now be used to fund your   │
│ virtual wallet at zero cost.               │
│                                             │
│ [Fund Wallet Now] [View All Accounts] [Done]│
└─────────────────────────────────────────────┘
```

#### **Whitelisted Account Management**

**Account Status Management**:
```
┌─────────────────────────────────────────────┐
│ MANAGE ACCOUNT: ICICI Bank ****3456         │
├─────────────────────────────────────────────┤
│ Current Status: ✅ Active                   │
│ Last Funding: 3 days ago (₹25,000)         │
│ Total Funded: ₹2,45,000 (This month)       │
│                                             │
│ AVAILABLE ACTIONS:                          │
│ 🔄 Temporarily Deactivate Account           │
│ ⚙️ Modify Daily/Monthly Limits              │
│ 📊 View Funding History                     │
│ 🗑️ Permanently Remove Account               │
│                                             │
│ FUNDING LIMITS:                             │
│ Daily: ₹2,45,000 / ₹5,00,000 (49% used)    │
│ Monthly: ₹12,35,000 / ₹1,00,00,000 (12%)   │
│                                             │
│ [Close] [Take Action]                       │
└─────────────────────────────────────────────┘
```

#### **Non-Whitelisted Funding Detection**

**User Story**:
*"When someone tries to fund the virtual wallet from an unauthorized account, the system should flag it for review rather than accepting the funds."*

**Detection Flow**:
```
Funding Attempt → Account Check → Whitelist Verification → 
Flag for Review → Merchant Notification → Admin Review
```

**Flagged Transaction Interface**:
```
┌─────────────────────────────────────────────┐
│ FUNDING ATTEMPT FLAGGED 🚨                  │
├─────────────────────────────────────────────┤
│ Date: 05-Sep-2025 16:45                     │
│ Amount: ₹75,000                             │
│ UTR: HDFC20250905164523                     │
│                                             │
│ FROM ACCOUNT:                               │
│ Holder: XYZ Enterprises                     │
│ Account: ****7890 (HDFC Bank)              │
│ IFSC: HDFC0001234                          │
│                                             │
│ STATUS: Under Review                        │
│ Reason: Account not whitelisted             │
│                                             │
│ ACTIONS REQUIRED:                           │
│ If this is your account:                    │
│ [Add to Whitelist] [Verify Ownership]       │
│                                             │
│ If this is unauthorized:                    │
│ [Report Fraud] [Block Account]              │
│                                             │
│ [Contact Support] [View Details]            │
└─────────────────────────────────────────────┘
```

### 3.5 Virtual Wallet Operations - Complete User Experience

#### **Virtual Wallet Dashboard Overview**

**User Story**:
*"As Rajesh, I want to monitor my virtual wallet balance, understand fee deductions, and manage wallet funding efficiently to ensure smooth transaction processing."*

**Virtual Wallet Main Interface**:
```
┌───────────────────────────────────────────────────────────────────────────────┐
│ VIRTUAL WALLET DASHBOARD                           [⚙️ Settings] [📊 Analytics]│
├───────────────────────────────────────────────────────────────────────────────┤
│ WALLET OVERVIEW:                                                                │
│ Virtual Account: 987654321012                    Balance: ₹45,678.90           │
│ Wallet ID: VW_ABC_20250905_001                   Fee Reserve: ₹12,340.50       │
│ Status: ✅ Active                                Available: ₹33,338.40         │
├───────────────────────────────────────────────────────────────────────────────┤
│ TODAY'S ACTIVITY:                                                               │
│ Fee Deductions: ₹340 (28 transactions)          Credits: ₹50,000 (2 credits)   │
│ Estimated Tomorrow: ₹420 (15 scheduled)          Low Balance Alert: Off         │
├───────────────────────────────────────────────────────────────────────────────┤
│ QUICK ACTIONS:                                                                  │
│ [💳 Add Money] [📤 View All Credits] [📥 View All Debits] [📊 Monthly Summary] │
└───────────────────────────────────────────────────────────────────────────────┘
```

#### **Add Money to Virtual Wallet - Detailed Journey**

**Step 1: Funding Method Selection**
```
Add Money → Method Selection → Source Selection → 
Amount Entry → Verification → Processing → Confirmation
```

**Funding Options Interface**:
```
┌─────────────────────────────────────────────────────────┐
│ FUND YOUR VIRTUAL WALLET                                    │
├─────────────────────────────────────────────────────────┤
│ METHOD 1: FROM CONNECTED BANK (RECOMMENDED) ⭐              │
│ 🏦 Shivalik Bank - ****6789                               │
│ Available: ₹28,47,569.50                                   │
│ Processing: Instant transfer                                │
│ Fee: ₹0 (Free from connected bank)                         │
│ [Select This Method] ✅                                    │
│                                                             │
│ METHOD 2: FROM WHITELISTED ACCOUNTS                         │
│ 🏦 HDFC Bank - ****1234 (₹0 fee)                          │
│ 🏦 ICICI Bank - ****5678 (₹0 fee)                         │
│ Processing: Manual verification required                    │
│ [Select Whitelisted Account]                                │
│                                                             │
│ METHOD 3: UPI TRANSFER                                      │
│ 📱 Scan QR code or use UPI ID                             │
│ UPI ID: abctextiles@paywize                                │
│ Processing: Instant (during banking hours)                 │
│ Fee: ₹0 (Standard UPI rates)                               │
│ [Show QR Code]                                              │
└─────────────────────────────────────────────────────────────┘
```

**Step 2: Amount Entry & Purpose (Connected Bank Selected)**
```
┌─────────────────────────────────────────────┐
│ TRANSFER FROM SHIVALIK BANK                 │
├─────────────────────────────────────────────┤
│ From Account: ****6789                      │
│ Available Balance: ₹28,47,569.50            │
│ Account Status: ✅ Active                   │
│                                             │
│ TRANSFER AMOUNT:                            │
│ Amount: ₹ [1,00,000]                       │
│ In Words: One Lakh Rupees Only             │
│                                             │
│ PURPOSE (Required):                         │
│ ⚬ Transaction Fee Reserve ✅                │
│ ⚬ General Wallet Funding                    │
│ ⚬ Upcoming Bulk Payments                    │
│ ⚬ Emergency Fund Maintenance                │
│                                             │
│ TRANSACTION DETAILS:                        │
│ Processing Time: Instant                    │
│ Transfer Fee: ₹0                           │
│ New Wallet Balance: ₹1,45,678.90           │
│                                             │
│ [Cancel] [Confirm Transfer]                 │
└─────────────────────────────────────────────┘
```

**Step 3: Transfer Processing & Confirmation**
```
API Call to Shivalik Bank → Fund Transfer → 
Balance Update → Transaction Logging → Success Notification
```

**Processing Screen**:
```
┌─────────────────────────────────────────────┐
│ PROCESSING TRANSFER...                      │
├─────────────────────────────────────────────┤
│ ✅ Transfer request initiated               │
│ 🔄 Connecting to Shivalik Bank...          │
│ 🔄 Validating account details...            │
│ 🔄 Processing fund transfer...              │
│ ⏳ Updating wallet balance...               │
│                                             │
│ Please do not close this window             │
│ Transfer typically completes in 10-30 sec   │
└─────────────────────────────────────────────┘
```

**Success Confirmation**:
```
┌─────────────────────────────────────────────┐
│ TRANSFER SUCCESSFUL ✅                      │
├─────────────────────────────────────────────┤
│ Amount: ₹1,00,000                          │
│ From: Shivalik Bank ****6789               │
│ To: Virtual Wallet ****1012                │
│                                             │
│ TRANSACTION DETAILS:                        │
│ UTR: SIB250905163045                        │
│ IRN: PWVCEDDMMYY000078                     │
│ Time: 05-Sep-2025 16:30:45                 │
│                                             │
│ NEW BALANCES:                               │
│ Virtual Wallet: ₹1,45,678.90               │
│ Shivalik Bank: ₹27,47,569.50               │
│                                             │
│ [View Transaction] [Add More] [Done]        │
└─────────────────────────────────────────────┘
```

#### **Manual Funding (Non-Connected Bank) Journey**

**Step 1: Manual Transfer Instructions**
```
┌─────────────────────────────────────────────┐
│ MANUAL WALLET FUNDING                       │
├─────────────────────────────────────────────┤
│ Transfer funds to your virtual account:      │
│                                             │
│ BENEFICIARY DETAILS:                        │
│ Name: ABC Textiles Private Limited          │
│ Account: 987654321012                       │
│ IFSC: SIBL0000123                          │
│ Bank: Shivalik Bank                         │
│                                             │
│ IMPORTANT:                                  │
│ ⚠️ Use only whitelisted accounts            │
│ ⚠️ Add your Wallet ID in remarks            │
│ ⚠️ Keep transaction receipt ready           │
│                                             │
│ Wallet ID: VW_ABC_20250905_001             │
│                                             │
│ [Copy Account Details] [I've Made Transfer] │
└─────────────────────────────────────────────┘
```

**Step 2: Manual Credit Entry**
```
┌─────────────────────────────────────────────┐
│ RECORD MANUAL TRANSFER                      │
├─────────────────────────────────────────────┤
│ TRANSACTION DETAILS:                        │
│ Amount: ₹ [50,000]                         │
│ UTR Number: [HDFC20250905154523]           │
│ From Account: [1234567890123456]            │
│ Transfer Date: [05-Sep-2025]                │
│ Transfer Time: [15:45]                      │
│                                             │
│ PROOF OF PAYMENT:                           │
│ [🔎 Upload Receipt] receipt.jpg (2.3 MB)   │
│ File Status: ✅ Uploaded successfully       │
│                                             │
│ VERIFICATION:                               │
│ 🔄 Checking from account whitelist...       │
│ ✅ Account verified: HDFC Bank ****1234     │
│ 🔄 UTR validation in progress...            │
│                                             │
│ [Cancel] [Submit for Verification]          │
└─────────────────────────────────────────────┘
```

**Step 3: Verification Process**
```
Manual Entry → Whitelist Check → UTR Verification → 
Bank Statement Matching → Auto-Credit → Confirmation
```

#### **Virtual Wallet Transaction History**

**Credits History Interface**:
```
┌───────────────────────────────────────────────────────────────────────────────┐
│ VIRTUAL WALLET CREDITS                            [📊 Export] [🔍 Filter]       │
├───────────────────────────────────────────────────────────────────────────────┤
│ Date/Time        │ IRN              │ Source Bank     │ UTR           │ Amount   │
├───────────────────────────────────────────────────────────────────────────────┤
│ 05-Sep 16:30:45 │ PWVCEDDMMYY000078│ Shivalik ****89│ SIB2509051630│ ₹1,00,000│
│ 05-Sep 15:45:20 │ PWVCEDDMMYY000077│ HDFC Bank ****34│ HDFC250905154│ ₹50,000  │
│ 04-Sep 11:30:15 │ PWVCEDDMMYY000076│ Manual Entry    │ ICIC250904113│ ₹25,000  │
│ 04-Sep 09:15:30 │ PWVCEDDMMYY000075│ Shivalik ****89│ SIB2509040915│ ₹75,000  │
│ 03-Sep 14:20:45 │ PWVCEDDMMYY000074│ UPI Transfer    │ UPI250903142 │ ₹30,000  │
└───────────────────────────────────────────────────────────────────────────────┘
```

**Debits History Interface**:
```
┌───────────────────────────────────────────────────────────────────────────────┐
│ VIRTUAL WALLET DEBITS (FEE DEDUCTIONS)           [📊 Export] [🔍 Filter]       │
├───────────────────────────────────────────────────────────────────────────────┤
│ Date/Time        │ IRN              │ Transaction Type│ Fee Amount    │ Balance  │
├───────────────────────────────────────────────────────────────────────────────┤
│ 05-Sep 16:45:30 │ PWVDEDDMMYY000156│ Single Payment  │ ₹5 (IMPS)    │ ₹45,673  │
│ 05-Sep 16:30:15 │ PWVDEDDMMYY000155│ Single Payment  │ ₹10 (RTGS)   │ ₹45,678  │
│ 05-Sep 15:45:45 │ PWVDEDDMMYY000154│ Bulk Payment    │ ₹150 (50×₹3) │ ₹45,688  │
│ 05-Sep 14:30:20 │ PWVDEDDMMYY000153│ Scheduled Paymt │ ₹6 (₹25K)    │ ₹45,838  │
│ 05-Sep 12:15:10 │ PWVDEDDMMYY000152│ Single Payment  │ ₹3 (NEFT)    │ ₹45,844  │
└───────────────────────────────────────────────────────────────────────────────┘
```

#### **Wallet Analytics & Insights**

**Monthly Summary Dashboard**:
```
┌───────────────────────────────────────────────────────────────────────────────┐
│ VIRTUAL WALLET ANALYTICS - SEPTEMBER 2025                                       │
├───────────────────────────────────────────────────────────────────────────────┤
│ MONTHLY OVERVIEW:                                                                │
│ Total Credits: ₹8,45,000 (12 transactions)    Total Debits: ₹2,340 (156 fees) │
│ Net Inflow: ₹8,42,660                         Average Daily Usage: ₹28,089     │
│                                                                                  │
│ FUNDING SOURCES:                                                                 │
│ Connected Banks: 65% (₹5,49,250)              Manual Transfers: 25% (₹2,11,250)│
│ UPI Transfers: 10% (₹84,500)                  Others: 0%                        │
│                                                                                  │
│ FEE BREAKDOWN:                                                                   │
│ IMPS Fees: ₹780 (156 × ₹5)                   NEFT Fees: ₹450 (150 × ₹3)       │
│ RTGS Fees: ₹400 (40 × ₹10)                   Bulk Processing: ₹710 (misc)      │
│                                                                                  │
│ INSIGHTS:                                                                        │
│ • Peak funding days: 1st, 15th, 30th of month                                  │
│ • Most active hours: 10 AM - 4 PM                                              │
│ • Lowest balance recorded: ₹2,450 (23rd Sept)                                  │
│ • Recommendation: Maintain minimum ₹15,000 for smooth operations               │
└───────────────────────────────────────────────────────────────────────────────┘
```

---

## 4. Commercial Model & Pricing

### 4.1 Package Structure

| Package | Tier | Slab 1 (₹1-1,000) | Slab 2 (₹1,001-25,000) | Slab 3 (₹25,001-1,00,000) |
|---------|------|-------------------|------------------------|----------------------------|
| Entry | Minimum | ₹2 | ₹3 | ₹6 |
| Basic | Standard | ₹3 | ₹4 | ₹7 |
| Standard | Mid-tier | ₹4 | ₹5 | ₹8 |
| Premium | High-tier | ₹5 | ₹6 | ₹10 |
| Top Tier | Maximum | ₹6 | ₹8 | ₹12 |
| Custom | Flexible | Admin Defined | Admin Defined | Admin Defined |

### 4.2 Special Pricing
- **NEFT/RTGS Transactions**: Flat ₹10 per transaction (regardless of amount)
- **Self-Onboarding Default**: Top Tier package
- **Virtual Wallet Funding**: Zero cost from connected banks

### 4.3 Transaction Limits
- **Self-Onboarding Default**: ₹5,00,000 per day per connected bank
- **Admin Configurable**: Up to ₹5 crores (post-verification)

---

## 5. Technical Architecture

### 5.1 API Specifications

#### Merchant APIs
```
POST /api/v1/connected-banking/initiate
POST /api/v1/connected-banking/status-check
POST /api/v1/connected-banking/balance-fetch
POST /api/v1/webhooks/transaction-callback
```

#### Shivalik Bank Integration APIs
```
POST /bank/api/v1/transaction
POST /bank/api/v1/status-check
GET /bank/api/v1/balance
GET /bank/api/v1/mini-statement
POST /bank/webhooks/status-update
```

### 5.2 Security Framework
- **Payload Encryption**: End-to-end encryption for all API requests/responses
- **Bearer Token Authentication**: 15-minute validity with auto-refresh
- **Webhook Security**: Signed payloads with timestamp validation

### 5.3 IRN Format Standards
- **Credit Transactions**: PSBCEDDMMYY000001
- **Debit Transactions**: PSBDEDDMMYY000001
- **Virtual Wallet Credit**: PWVCEDDMMYY000001
- **Virtual Wallet Debit**: PWVDEDDMMYY000001

---

## 6. Admin Panel Features

### 6.1 Merchant Management
- **Enable/Disable Connected Banking**: Per merchant control
- **Bank Channel Management**: Individual bank activation/deactivation
- **Limit Configuration**: Custom daily/transaction limits
- **Commercial Package Assignment**: Flexible pricing model selection

### 6.2 Bank-Specific Dashboard
#### Shivalik Bank Metrics
- Total transaction volume
- Success/failure rates
- Active merchant count
- Fee collection summary
- Real-time balance monitoring

### 6.3 Consolidated Dashboard
- **Platform Overview**: All connected banking metrics
- **Virtual Wallet Analytics**: Total assigned VAMs, utilization
- **Fee Collection**: Revenue tracking across all merchants
- **Date Range Filtering**: Custom period analysis

### 6.4 Reporting Module
- **Merchant-wise Reports**: Individual performance metrics
- **Product Reports**: Connected banking usage patterns
- **Virtual Wallet Reports**: Funding and utilization analytics
- **Export Options**: PDF, Excel, CSV formats

---

## 7. Implementation Phases

### Phase 1: Foundation (Weeks 1-4)
- [ ] Virtual wallet assignment system
- [ ] Basic Shivalik Bank integration
- [ ] Merchant onboarding flow
- [ ] Core transaction processing

### Phase 2: Enhanced Features (Weeks 5-8)
- [ ] Beneficiary management system
- [ ] Whitelisting functionality
- [ ] Smart insights dashboard
- [ ] Fee calculation engine

### Phase 3: Advanced Operations (Weeks 9-12)
- [ ] Bulk transaction processing
- [ ] Scheduled payments
- [ ] Payment link functionality
- [ ] Comprehensive reporting

### Phase 4: Admin & Analytics (Weeks 13-16)
- [ ] Complete admin panel
- [ ] Advanced analytics
- [ ] Custom commercial packages
- [ ] Security enhancements

---

## 8. Success Metrics

### Business KPIs
- **Merchant Adoption Rate**: Target 80% within 3 months
- **Transaction Volume**: ₹10 crores monthly target
- **Fee Collection**: 95% automated deduction success
- **Platform Uptime**: 99.9% availability

### User Experience Metrics
- **Onboarding Completion**: <10 minutes average
- **Transaction Success Rate**: >98%
- **Dashboard Load Time**: <2 seconds
- **Support Ticket Volume**: <5% of active merchants

### Technical Metrics
- **API Response Time**: <500ms average
- **Webhook Delivery**: 99% success rate
- **Security Incidents**: Zero tolerance
- **Data Accuracy**: 100% financial reconciliation

---

## 9. Risk Management

### Operational Risks
- **Virtual Wallet Funding**: Whitelist verification prevents unauthorized funding
- **Transaction Failures**: Automated retry mechanisms with manual intervention
- **Balance Insufficiency**: Pre-transaction balance validation

### Compliance Risks
- **KYC/AML**: Mandatory eKYC/eKYB completion
- **Audit Trail**: Complete transaction logging with IRN tracking
- **Regulatory Reporting**: Automated compliance report generation

### Technical Risks
- **System Downtime**: Redundant infrastructure with failover capabilities
- **Data Security**: Encryption at rest and in transit
- **Integration Failures**: Circuit breakers and fallback mechanisms

---

## 10. Immediate Next Steps (Phase 1 Focus)

### **Week 1-2: Foundation Setup**
1. **Stakeholder Alignment**: Technical and business team review of Phase 1 scope
2. **Shivalik Bank API Integration**: Complete API documentation and testing
3. **Development Environment**: Set up staging environment with bank sandbox
4. **Security Framework**: Implement encryption and bearer token authentication

### **Week 3-4: Core Development**
1. **Virtual Wallet System**: VAMS integration and account assignment logic
2. **Merchant Onboarding**: eKYC/eKYB flow with e-signature integration
3. **Basic Transaction Processing**: Single payout functionality
4. **Fee Calculation Engine**: Slab-based pricing implementation

### **Week 5-6: Testing & Launch**
1. **Integration Testing**: End-to-end transaction flow validation
2. **Security Audit**: Third-party security assessment
3. **Pilot Program**: 10 select merchants for beta testing
4. **Go-Live Preparation**: Production environment setup and monitoring

### **Immediate Resource Requirements:**
- **Development Team**: 6 engineers (2 backend, 2 frontend, 1 DevOps, 1 QA)
- **Business Team**: 2 product managers, 1 compliance officer
- **External**: Security audit firm, legal review for merchant agreements

### **Success Definition for Phase 1:**
- 50 merchants successfully onboarded
- ₹1 crore transaction volume processed
- 95% transaction success rate
- Zero security incidents
- <10 minutes average onboarding time

This focused approach ensures we build a rock-solid foundation with Shivalik Bank first, then systematically add the market-leading features that will differentiate us from all competitors.

---

*This document serves as the foundational blueprint for the Connected Banking product development and should be reviewed and updated as requirements evolve.*