CHAPTER 5
Active Rescue Alerts & Volunteer Response System

Project: AnimaAid

Version: 1.0

5.1 Purpose

The Active Rescue Alerts module serves as the operational control center for all ongoing rescue cases.

It enables:

Citizens to view rescue activity.
Volunteers to discover nearby emergencies.
NGOs to monitor assigned cases.
Veterinarians to prepare for incoming animals.
Administrators to oversee rescue operations.

Every rescue case should remain visible and trackable from creation until resolution.

5.2 Objectives

The module should:

Display active rescue alerts in real time.
Prioritize cases by urgency.
Reduce volunteer response time.
Prevent duplicate rescue assignments.
Provide complete rescue transparency.
Allow volunteers to manage their assigned cases.
Automatically update all stakeholders when a case status changes.
5.3 User Roles

The interface adapts depending on the logged-in user's role.

Citizen

Can:

View active rescue alerts.
Track reports they submitted.
View rescue progress.
Contact emergency services (where applicable).

Cannot:

Accept rescue assignments.
Volunteer

Can:

View nearby alerts.
Accept rescue cases.
Navigate to the rescue location.
Update rescue progress.
Upload rescue photos.
Complete rescue cases.
NGO

Can:

Assign volunteers.
Coordinate rescues.
View organizational rescue statistics.
Manage shelters and transport.
Veterinarian

Can:

View incoming rescue cases.
Prepare treatment.
Update medical notes.
Mark treatment completed.
Administrator

Can:

View all cases.
Reassign volunteers.
Remove spam reports.
Resolve conflicts.
Monitor system-wide rescue activity.
5.4 Screen Layout
App Bar

↓

Statistics Dashboard

↓

Severity Filters

↓

Search Bar

↓

Advanced Filters

↓

Active Alert List

↓

Floating Action Button

↓

Bottom Navigation
5.5 App Bar

Left:

← Back

Center:

Active Rescue Alerts

Right:

Search

Filter

Refresh

5.6 Rescue Statistics Dashboard

Displayed at the top.

Beautiful rounded cards.

Horizontal scrolling.

Cards display:

🚨 Active

👥 Volunteers Assigned

🏥 Animals Under Treatment

✅ Resolved Today

⚡ Critical Cases

❤️ Animals Saved This Week

Numbers animate when updated.

Refreshes automatically.

5.7 Severity Filter Chips

Rounded Material 3 chips.

Options:

All

🔴 Critical

🟠 High

🟡 Medium

🟢 Low

✅ Resolved

Only one active at a time.

Selected chip:

Filled background

White text

Smooth animation

Instant filtering.

5.8 Search

Users can search by:

Animal type
Location
Reporter
Case ID
Volunteer
Shelter
NGO
Status

Supports:

Voice search

Autocomplete

Recent searches

5.9 Advanced Filters

Optional expandable panel.

Filters include:

Distance

Date

Status

Species

Urgency

Assigned Volunteer

Reporter Type

NGO

Veterinarian

Shelter

Sort By

Newest

Nearest

Highest Priority

Recently Updated

5.10 Rescue Alert Cards

Each rescue case appears as a modern card.

Rounded corners

Soft shadow

Large spacing

Subtle entrance animation

Card Layout
Left

Animal thumbnail

Rounded corners

Shows uploaded image.

If unavailable

Cute placeholder illustration.

Top Left

Severity indicator

Examples:

🔴 Critical

🟠 High

🟡 Medium

🟢 Low

Top Right

Status badge

Possible values:

Active

Accepted

Volunteer Assigned

En Route

Arrived

Rescue Started

Transporting

At Shelter

Under Treatment

Resolved

Cancelled

Center

Large bold title.

Examples:

Dog Hit by Vehicle

Kitten Trapped in Drain

Cow with Broken Leg

Monkey Injured by Electric Wire

Bird with Broken Wing

Below title

Animal type

Distance

Time reported

Location

📍

Complete address

Distance from current user

Estimated travel time

Bottom row

Reporter

Volunteer

Last updated

Quick buttons

Navigate

Call

Accept (volunteers only)

Bookmark

Share

5.11 Card Actions

Tap anywhere

Opens

Case Details Bottom Sheet

Swipe right

Bookmark

Swipe left

Quick Share

Long press

Quick actions menu

5.12 Case Details Bottom Sheet

Covers

90% of screen.

Rounded top corners.

Draggable.

Scrollable.

Background dims.

Includes close button.

Section 1

Case Header

Displays:

Case ID

Current Status

Severity

Emergency Type

Animal Type

Time

Distance

Section 2

Before & After Images

Side-by-side comparison.

Before Rescue

Uploaded image

After Rescue

Placeholder until rescue completes.

Supports:

Zoom

Full-screen preview

Download (authorized users only)

Section 3

Case Information

Displays:

Animal Type

Species

Breed

Gender

Estimated Age

Condition

Current Status

Priority

Reporter

Anonymous option

Phone (if permitted)

Section 4

Description

Full rescue description.

Supports translated view if the volunteer's preferred language differs from the reporter's.

Section 5

Location

Interactive map

Address

GPS coordinates

Nearest landmark

Distance

Estimated travel time

Buttons:

Navigate

Copy Address

Share Location

Section 6

Emergency Timeline

Vertical timeline.

Report Created

↓

Volunteer Accepted

↓

Volunteer En Route

↓

Arrived

↓

Animal Stabilized

↓

Transport Started

↓

Reached Vet/Shelter

↓

Treatment

↓

Recovered

↓

Resolved

Each event displays:

Timestamp

Volunteer

Notes

Photos

Section 7

Rescue Notes

Visible to authorized responders.

Contains:

Observations

Medical notes

Treatment recommendations

Shelter information

Special handling instructions

5.13 Volunteer Workflow

If user is not a volunteer:

Display:

Become a Volunteer

Button opens registration.

If user is a volunteer:

Buttons change dynamically.

Initial:

Accept Rescue

↓

Navigate

↓

Mark En Route

↓

Mark Arrived

↓

Begin Rescue

↓

Upload Rescue Photo

↓

Transport Animal

↓

Reach Shelter/Vet

↓

Complete Rescue

Each action updates every user's screen in real time.

5.14 Upload After Rescue

After rescue completion:

Volunteer uploads:

Photos

Condition

Medical notes

Shelter

Veterinarian

Estimated recovery

Follow-up needed

Animal released?

Adopted?

Transferred?

Final remarks

These populate the "After Rescue" section.

5.15 Smart Volunteer Assignment

Instead of relying only on manual acceptance, the system suggests the most suitable volunteer based on:

Distance

Availability

Previous experience

Vehicle type

Animal specialization

Current workload

Response history

Administrators may override assignments.

5.16 Live Tracking

During active rescues:

Reporter can see:

Volunteer location (if shared)

Estimated arrival

Navigation progress

Current rescue stage

Communication updates

Location sharing is optional and privacy-aware.

5.17 Communication

Case-specific communication supports:

Secure in-app chat

Voice call (masked number)

Photo sharing

Voice notes

Quick status updates

Predefined emergency messages

Examples:

"Running 10 minutes late."

"Animal transported."

"Need additional assistance."

"Vet required urgently."

5.18 Notifications

Real-time notifications include:

New nearby alert

Volunteer accepted

Volunteer arrived

Animal rescued

Treatment completed

Additional volunteer requested

Case reassigned

Case resolved

All notifications include the Case ID for easy reference.

5.19 Offline Support

Volunteers can:

View cached assignments

Read case details

Use downloaded maps

Record notes

Capture rescue photos

Changes sync automatically when internet returns.

5.20 Empty State

Illustration

Happy sleeping puppy.

Message

"No active rescue alerts nearby."

Buttons

Refresh

Expand Search Radius

View Resolved Cases

5.21 Loading State

Use skeleton placeholders.

Shimmer animation.

Load images lazily.

5.22 Error State

Examples:

Unable to load alerts.

GPS unavailable.

Server timeout.

Volunteer assignment failed.

Each includes:

Retry

Continue Offline (where applicable)

Report Issue

5.23 Performance Requirements
Support thousands of concurrent rescue cases.
Real-time updates without manual refresh.
Smooth scrolling at 60 FPS.
Lazy-load images.
Efficient caching.
Fast filtering and search.
5.24 Accessibility

Supports:

Screen readers

Large touch targets

Dynamic font sizes

High contrast mode

Color-blind-friendly severity indicators

Voice control for key actions

5.25 Security

Only authorized responders can:

View reporter contact information.

Upload rescue completion photos.

Modify rescue timelines.

Close rescue cases.

All changes are logged with timestamps and user IDs.

5.26 Analytics

The system records:

Average response time

Volunteer acceptance time

Travel time

Treatment duration

Resolution time

Rescue success rate

Most common emergency types

Peak rescue hours

Regional rescue trends

This data powers dashboards and helps improve rescue operations over time.

5.27 Acceptance Criteria

The Active Rescue Alerts module is considered complete when:

Rescue cases appear in real time after SOS submission.
Alerts can be filtered, searched, and sorted efficiently.
Volunteers can manage the full rescue lifecycle.
Case details provide complete rescue information.
Before and after rescue images are supported.
Timelines update live.
Reporter privacy is respected.
Offline functionality works for field volunteers.
Accessibility and performance standards are satisfied.