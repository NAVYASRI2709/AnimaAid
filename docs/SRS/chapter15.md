Chapter 15 — Security Architecture & Privacy Framework
AnimaAid — Software Requirements Specification (SRS)
15.1 Purpose

This chapter defines the complete security architecture of AnimaAid.

Because AnimaAid stores sensitive information regarding:

rescued animals
users
adopters
donors
volunteers
shelters
veterinarians
NGOs
payment transactions
medical records
AI predictions
location data

security must be designed as a core feature rather than an afterthought.

The objective is to ensure:

Confidentiality
Integrity
Availability
Accountability
Privacy
Compliance
Disaster Recovery
15.2 Security Design Principles

The system shall follow:

Defense in Depth

Multiple security layers protect every component.

Examples:

Authentication
Authorization
Database rules
API validation
Encryption
Firewalls
Monitoring
Audit logging
Least Privilege

Every user receives only the permissions required.

Example:

Volunteer

Can:

view assigned rescues
update rescue progress

Cannot:

delete users
access payments
modify AI models
Zero Trust

Every request is verified.

Never assume:

device is trusted
network is trusted
previous login guarantees future access

Every API validates:

identity
permissions
token
session
device
Secure by Default

All features start in the safest configuration.

Examples:

Location sharing:

OFF unless enabled.

Public profile:

Hidden until user allows.

Medical records:

Private.

15.3 Authentication System

Supported methods:

Email + Password

Requirements:

Minimum:

8 characters

Must include:

uppercase
lowercase
number

Recommended:

special character

Password strength meter shown.

OTP Login

Supported:

Email OTP
Mobile OTP

OTP validity:

5 minutes

Maximum attempts:

5

Google Login

OAuth authentication.

Retrieve:

name
email
profile photo

Nothing else.

Apple Login

Supported for iOS.

Future Support
Facebook
Microsoft
Government Digital ID
NGO Single Sign-On
15.4 Multi-Factor Authentication (MFA)

Available for:

NGOs
Admins
Veterinarians
Shelter Managers
Premium users

Methods:

Email OTP
SMS OTP
Authenticator App
Security Key

Future:

Passkeys.

15.5 Session Management

Every session includes:

Device ID
Login time
IP address
OS
Browser
App version

Users can view:

Active sessions.

Options:

Logout current
Logout other devices
Logout all devices

Automatic timeout:

30 minutes of inactivity.

Refresh token rotation enabled.

15.6 Password Security

Passwords are never stored in plain text.

Use:

Strong salted hashing.

Examples:

Argon2
bcrypt

Password reset:

Email verification

OR

OTP verification.

Password history:

Last five passwords cannot be reused.

15.7 Authorization Model

Role-Based Access Control (RBAC).

Roles include:

Guest

User

Volunteer

Shelter

Veterinarian

NGO

Moderator

Regional Admin

Super Admin

Developer (Internal)

Support Agent

Each role contains:

read permissions
write permissions
delete permissions
export permissions
administrative permissions
15.8 Permission Matrix

Example:

Guest

Can:

browse pets
read articles

Cannot:

rescue
donate
chat
upload

Registered User

Can:

rescue reports
adopt
donate
AI assistant
chat

Cannot:

moderate users

Volunteer

Additional permissions:

rescue updates
assigned rescue editing
emergency reports

Veterinarian

Additional:

upload diagnoses
prescribe treatments
medical history

Cannot:

access donations

NGO

Can:

manage organization
verify rescues
assign volunteers

Admin

Full administrative control.

15.9 API Security

Every endpoint validates:

Authentication

Authorization

Input validation

Rate limits

Payload size

Request origin

Timestamp

Replay protection

Sensitive APIs require:

Higher privilege verification.

Examples:

Payment APIs

Medical APIs

User deletion

Role assignment

AI administration

15.10 API Tokens

JWT-based authentication.

Access token:

Short lifespan

Refresh token:

Long lifespan

Automatic refresh.

Revocation supported.

Compromised tokens immediately invalidated.

15.11 Data Encryption

Data at Rest

Encrypted databases.

Encrypted backups.

Encrypted storage.

Data in Transit

HTTPS only.

TLS 1.3

No insecure HTTP.

Sensitive fields additionally encrypted:

Examples:

medical notes
addresses
phone numbers
payment identifiers
15.12 Database Security

Rules:

Prepared statements

Parameterized queries

ORM validation

No raw SQL from user input.

Automatic SQL Injection prevention.

Database accounts:

Separate:

Development

Testing

Production

Readonly analytics

Backup services

15.13 File Upload Security

Allowed:

Images

PDF

Medical reports

Vaccination certificates

Videos

Maximum sizes configurable.

Every upload:

Virus scanned.

File type verified.

MIME type verified.

Extension verified.

Random filename generated.

Metadata sanitized.

Forbidden uploads:

Executable files

Scripts

Unknown binaries

Malicious archives

15.14 Image Protection

Uploaded images:

Compressed

Optimized

Virus scanned

GPS metadata removed unless explicitly required for rescue operations.

Thumbnail generated.

Original retained.

15.15 AI Security

AI services receive minimum required data.

Personally identifiable information removed whenever possible.

Examples:

Instead of:

"My dog Tommy from 15 Rose Street"

AI receives:

"Adult Labrador"

AI logs separated from user identity.

AI prompts sanitized.

Prevent:

Prompt Injection

Model Abuse

Spam

Jailbreak attempts

15.16 Rate Limiting

Protects against abuse.

Examples:

Login

5 attempts/minute

Search

100/minute

AI

20/minute

Upload

10/hour

Donation API

Strict throttling

Adaptive rate limiting:

Higher restrictions for suspicious traffic.

15.17 Bot Protection

Detect:

Spam

Fake registrations

Mass uploads

Credential stuffing

Automated attacks

Solutions:

CAPTCHA

Behavior analysis

Device fingerprinting

Risk scoring

15.18 Audit Logging

Every important action logged.

Examples:

Login

Logout

Password reset

Donation

Animal approval

Medical record update

Role change

AI moderation action

Each log stores:

Timestamp

User

Action

Object

Device

Location (approximate)

Success/Failure

Logs immutable.

Admins cannot edit logs.

15.19 Privacy Controls

Users control:

Profile visibility

Location sharing

Phone visibility

Email visibility

Adoption history

Volunteer profile

Donation anonymity

Search indexing

Communication preferences

15.20 Consent Management

Users explicitly consent to:

Data collection

Cookies

Location

AI analysis

Marketing

Notifications

Research participation

Every consent:

Timestamped

Versioned

Revocable

15.21 Child Safety

If minors use the platform:

Parental consent required where legally applicable.

No public exposure of:

School

Address

Phone

Personal information

Restricted messaging.

Enhanced moderation.

15.22 Animal Location Privacy

Sensitive rescue locations protected.

Examples:

Endangered species

Illegal trafficking investigations

Abuse cases

Pregnant rescued animals

Approximate locations shown publicly.

Exact GPS only visible to authorized rescuers.

15.23 Payment Security

Payments processed through certified payment providers.

Application never stores:

Full card number

CVV

PIN

Sensitive payment credentials

Support:

UPI

Cards

Net Banking

Wallets

International gateways

Payment events logged securely.

15.24 Backup Strategy

Automatic backups:

Hourly

Daily

Weekly

Monthly

Backup storage:

Multiple regions

Encrypted

Integrity checked

Versioned

Retention policy configurable.

15.25 Disaster Recovery

Recovery objectives:

Recovery Time Objective (RTO):

< 2 hours

Recovery Point Objective (RPO):

< 15 minutes

Automatic failover where infrastructure permits.

15.26 Monitoring & Threat Detection

Continuous monitoring:

CPU

Memory

Database

Traffic

Errors

API failures

Security events

Alerts generated for:

Repeated login failures

Privilege escalation

Mass downloads

Unexpected deletions

Bot activity

15.27 Incident Response Plan

Security incidents classified:

Level 1

Minor

Level 2

Moderate

Level 3

Critical

Response phases:

Detection
Verification
Containment
Investigation
Recovery
Notification
Root Cause Analysis
Preventive Improvements
15.28 Security Testing

Before every production release:

Static code analysis

Dependency scanning

Penetration testing

API testing

Authentication testing

Authorization testing

Mobile security testing

Cloud configuration review

Performance stress testing

Annual independent security audit recommended.

15.29 Compliance Objectives

The platform should be designed to support compliance with applicable regulations, depending on deployment region, including:

GDPR (European Union)
CCPA/CPRA (California, USA)
India's Digital Personal Data Protection (DPDP) Act
PCI DSS (payment processing)
OWASP ASVS and OWASP Top 10 security guidance
ISO/IEC 27001-aligned information security practices

Compliance requirements should be reviewed and updated as regulations evolve.

15.30 Security Dashboard (Administrative)

Authorized administrators can monitor:

Active user sessions
Failed login attempts
Blocked IP addresses
Security alerts
API usage statistics
Suspicious activities
File upload threats
Malware detections
Audit logs
Backup status
Encryption health
MFA adoption
Token revocations
System vulnerability scan summaries

Interactive dashboards should support filtering, search, export (where permitted), and real-time alerting for critical events.

15.31 Security Architecture Summary

The AnimaAid security framework is built around multiple complementary layers:

Secure authentication with optional MFA
Role-Based Access Control (RBAC)
End-to-end encryption for sensitive data
Secure API architecture with JWT and rate limiting
Protected file uploads and malware scanning
Privacy-first AI processing
Immutable audit logging
Continuous monitoring and threat detection
Automated backups and disaster recovery
Compliance-ready privacy controls
Administrative security dashboards
Regular security testing and continuous improvement

This layered approach ensures that user data, animal records, financial transactions, medical information, and AI-powered services remain protected while maintaining high availability, scalability, and regulatory readiness for future expansion.