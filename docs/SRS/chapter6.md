CHAPTER 6
Comprehensive Animal Welfare Reporting & Complaint Management System

Project: AnimaAid

Version: 1.0

6.1 Purpose

The Reporting Module is one of the core pillars of AnimaAid. Unlike the Emergency SOS module, which focuses on immediate rescue situations, the Reporting Module is designed for non-emergency animal welfare issues, legal complaints, negligence, cruelty, public safety concerns, environmental issues, and institutional reporting.

It enables citizens to report concerns to the appropriate authorities while ensuring transparency, accountability, and progress tracking.

The system should make reporting as simple as possible while collecting sufficient information for effective investigation.

6.2 Objectives

The Reporting Module should:

Allow citizens to report various animal welfare issues.
Route complaints to the appropriate authority.
Track complaint progress.
Prevent duplicate complaints.
Maintain evidence securely.
Protect whistleblowers.
Generate detailed analytics.
Support legal documentation.
Promote transparency.
6.3 Report Categories

Users can submit reports under the following categories.

Animal Abuse

Examples:

Physical abuse
Beating animals
Poisoning
Intentional injury
Animal fighting
Neglect
Starvation
Illegal confinement

Icon

🐶

Color

Red

Animal Cruelty

Examples

Torture
Burning
Mutilation
Deliberate abandonment
Illegal killing

Icon

⚠

Injured Animal (Non-Emergency)

For injuries that do not require immediate SOS response.

Examples

Minor wounds

Limping

Chronic illness

Abandoned Animal

Examples

Abandoned puppies

Abandoned kittens

Senior pets

Farm animals

Illegal Animal Transportation

Examples

Overcrowded transport

No ventilation

Illegal wildlife movement

Unsafe transport

Illegal Animal Relocation

Examples

Street dogs relocated illegally

Cats abandoned elsewhere

Wildlife released improperly

Illegal Animal Trade

Examples

Exotic pets

Protected species

Illegal breeding

Smuggling

Veterinary Complaint

Users may report:

Medical negligence

Fraud

Overcharging

Improper treatment

Animal mistreatment

Lack of hygiene

NGO Complaint

Examples

Failure to respond

Misuse of donations

Animal neglect

Poor shelter conditions

False rescue claims

Shelter Complaint

Examples

Poor sanitation

Overcrowding

Animal neglect

Food shortage

Unsafe conditions

Municipality Complaint

Examples

Garbage attracting animals

Dead animal not removed

Unsafe stray management

Water shortage

Illegal poisoning

Rabid Animal Report

For suspected rabies cases.

Triggers high-priority review.

Dead Animal Report

Examples

Roadkill

Dead livestock

Dead wildlife

Requires municipality notification.

Wildlife Sighting

Examples

Leopard

Elephant

Bear

Snake

Monkey conflict

Bird rescue

Environmental Hazard

Examples

Oil spill

Chemical contamination

Plastic waste

Fishing nets

Polluted water

Other

Allows custom report type.

6.4 User Flow
Open Report Center

↓

Choose Report Category

↓

Upload Evidence

↓

Select Location

↓

Provide Details

↓

Review Report

↓

Submit

↓

Authority Assigned

↓

Investigation

↓

Resolution

↓

Case Closed
6.5 Report Dashboard

Displays

My Reports

Pending

Under Investigation

Resolved

Rejected

Reopened

Drafts

Bookmarked

Statistics displayed at top.

6.6 Report Form Layout
Header

↓

Report Type

↓

Photo & Video Evidence

↓

Location

↓

Incident Details

↓

Animal Information

↓

Witness Information

↓

Additional Documents

↓

Anonymous Reporting

↓

Declaration

↓

Submit Report
6.7 Evidence Upload

Supports:

Photos

Videos

Audio recordings

PDF documents

Medical records

Police reports

NGO letters

News articles

Maximum:

10 files

Each file shows:

Preview

Upload progress

Remove

Rename

Compress automatically.

6.8 AI Evidence Assistance (Enhancement)

Dr. Paws AI assists users by checking uploaded media for quality and completeness.

Examples:

Image too blurry
GPS missing from photo
Multiple images of same scene detected
Possible duplicate submission

The AI may suggest:

"Consider adding one more image showing the animal's surroundings."

These suggestions improve report quality but never block submission.

6.9 Incident Location

Automatic GPS detection.

Displays

Interactive Map

Address

Coordinates

Nearest Landmark

City

District

State

Country

Users may

Move pin

Search location

Enter manually

6.10 Incident Details

Fields

Date

Time

Description

Estimated duration

Immediate danger?

Police informed?

Any previous complaints?

Maximum description

2000 characters.

Voice input supported.

6.11 Animal Information

Fields

Animal Type

Species

Breed

Color

Estimated Age

Gender

Identification marks

Collar

Microchip

Number of animals affected

Condition

Alive

Injured

Dead

Aggressive

Missing

Rescued

Unknown

6.12 Witness Information (Optional)

Users may add:

Witness Name

Phone

Email

Statement

Photo

Supports multiple witnesses.

6.13 Suspect Information (Optional)

If applicable.

Fields

Person

Organization

Vehicle Number

Business Name

Address

Phone

Description

Users are reminded to provide factual information only.

6.14 Supporting Documents

Upload:

Medical certificates

Veterinary reports

Police complaints

Legal notices

Government letters

NGO responses

Receipts

Invoices

These become part of the case history.

6.15 Anonymous Reporting

Users can choose:

Public report

Anonymous to public

Anonymous to everyone except authorities

Fully confidential whistleblower submission (subject to legal requirements)

The app explains what information will remain visible in each mode.

6.16 Declaration

Checkbox

"I confirm that the information provided is true to the best of my knowledge."

Users acknowledge that knowingly false reports may result in account action.

6.17 Smart Duplicate Detection

Before submission:

System checks:

Location

Animal

Time

Photos

Description similarity

If similar report exists:

Display

Possible Existing Report Found

Options

Join Existing Report

Continue Anyway

View Existing Report

6.18 Authority Routing Engine

Reports automatically route to the appropriate authority.

Examples

Animal abuse

→ Animal Welfare Board / Police

Veterinary complaint

→ Veterinary Council

Municipality issue

→ Municipal Corporation

Wildlife

→ Forest Department

Shelter complaint

→ Shelter Administration

NGO complaint

→ NGO Management / Moderator

Routing rules are configurable by region.

6.19 Case Tracking

Every report receives:

Unique Report ID

Status

Assigned Authority

Officer (if available)

Expected response

Timeline

Progress percentage

Users receive updates automatically.

6.20 Investigation Timeline

Example

Report Submitted

↓

Under Review

↓

Evidence Verified

↓

Officer Assigned

↓

Inspection Scheduled

↓

Investigation Complete

↓

Action Taken

↓

Resolved

Every stage records:

Date

Time

Officer

Notes

Supporting evidence

6.21 Communication Center

Secure messaging between:

Reporter

Assigned authority

Moderator

NGO

Veterinarian (when applicable)

Supports:

Text

Images

Documents

Voice notes

System messages

6.22 Notifications

Users receive updates when:

Report accepted

Evidence requested

Officer assigned

Inspection scheduled

Action taken

Report resolved

Report rejected

Appeal available

6.23 Appeals Process

If a report is rejected:

Users may:

Submit additional evidence

Request reconsideration

Escalate to higher authority (where supported)

Track appeal status

All appeal actions are logged.

6.24 Community Visibility

Users choose visibility:

Private

Visible to authorities only

Visible to verified volunteers

Public awareness post

Personally identifiable information is hidden according to privacy settings.

6.25 Report Analytics

Dashboard displays:

Reports submitted

Resolution rate

Average response time

Most common report type

Reports by district

Monthly trends

Personal contribution statistics

Administrators have access to broader regional analytics.

6.26 Offline Support

If internet is unavailable:

Reports are saved locally.

Media remains encrypted on the device until upload.

Users are informed that the report will be submitted automatically when connectivity returns.

6.27 Accessibility

Supports:

Screen readers
Dynamic text sizes
Voice dictation
High contrast mode
Large touch targets
Keyboard navigation (tablets)
6.28 Security & Privacy
All evidence is encrypted in transit and at rest.
Access is role-based.
Audit logs record every modification.
Personally identifiable information is protected according to user privacy settings.
Report history cannot be altered without authorization.
6.29 Backend Data Model

Each report should contain:

Report ID
User ID
Reporter Name
Report Category
Incident Type
Animal Information
Description
Evidence Files[]
Witnesses[]
Suspect Information
Latitude
Longitude
Address
Landmark
Assigned Authority
Assigned Officer
Status
Timeline[]
Notes[]
Appeal Status
Resolution Summary
Created Timestamp
Updated Timestamp
6.30 Acceptance Criteria

The Reporting Module is considered complete when:

Users can submit all supported report categories.
Photos, videos, audio, and documents can be attached.
Duplicate reports are intelligently detected.
Reports are automatically routed to the appropriate authority.
Users can track progress through a complete investigation timeline.
Appeals are supported for rejected reports.
Offline report creation and automatic synchronization function correctly.
Privacy, accessibility, and security requirements are satisfied.