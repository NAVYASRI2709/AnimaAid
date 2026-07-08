CHAPTER 4
Emergency SOS Module & Intelligent Rescue Reporting System

Project: AnimaAid

Version: 1.0

4.1 Purpose

The SOS Module is the most important feature of AnimaAid. It enables users to report animals in distress within seconds while automatically notifying nearby volunteers, NGOs, shelters, veterinarians, and authorized rescue organizations.

The system should minimize reporting time, maximize rescue accuracy, and provide complete transparency from the moment a case is created until it is resolved.

4.2 Design Goals

The SOS module must be:

Extremely fast (report in under 60 seconds)
Intuitive during stressful situations
Accessible to all users
Reliable with poor internet
Offline-capable
Secure against spam
GPS-aware
Image-supported
AI-assisted
Fully trackable
4.3 User Flow
Open SOS
      ↓
Select Emergency Type
      ↓
Take/Upload Photos
      ↓
GPS Detects Location
      ↓
Select Animal Type
      ↓
Select Condition
      ↓
Choose Urgency
      ↓
Describe Situation
      ↓
Review Report
      ↓
Confirm SOS
      ↓
Photos Upload
      ↓
GPS Saved
      ↓
Nearby Volunteers Notified
      ↓
Case Created
      ↓
Track Rescue Live
4.4 Screen Layout
App Bar

↓

Emergency Information Card

↓

Photo Upload

↓

Detected Location

↓

Animal Information

↓

Condition Chips

↓

Urgency Selection

↓

Description

↓

Nearest Landmark

↓

Contact Preferences

↓

Safety Notice

↓

Emergency Summary

↓

Confirm SOS Button
4.5 App Bar

Left

← Back

Center

Report Animal SOS

Right

Help Icon

Clicking Help opens emergency reporting instructions.

4.6 Emergency Information Banner

Displayed immediately below header.

Background

Light Amber

Icon

⚠

Message

If the animal is aggressive or dangerous, keep a safe distance and wait for trained rescuers.

Always visible.

4.7 Emergency Type

Users first select the type of emergency.

Only one option can be selected.

Cards include icon + title + description.

Options:

🚑 Injured Animal

🐾 Abandoned Animal

🚧 Trapped Animal

🚗 Road Accident

🩸 Bleeding

🔥 Burn Injury

☠ Poisoning

⚡ Electric Shock

🐍 Snake Bite

💧 Dehydration

🐶 Animal Abuse

🚛 Illegal Transportation

🌳 Wildlife Emergency

🐄 Farm Animal Emergency

❓ Other

If "Other" is selected:

Display text field

Specify Emergency

4.8 Photo Upload Section

Large upload container.

Rounded 24dp.

Dashed border.

Camera illustration.

Text

Add Photos (Recommended)

Subtitle

Photos help rescuers understand the situation faster.

Buttons

📷 Camera

🖼 Gallery

Maximum

5 images

Supported

JPEG

PNG

HEIC

WEBP

Each uploaded image displays:

Rounded preview

Remove button

Drag to reorder

Tap to enlarge

Upload progress

AI quality indicator

Example

✓ Good lighting

⚠ Blurry

⚠ Too dark

4.9 AI Image Analysis (Enhancement)

After image upload:

Dr. Paws AI performs optional image analysis.

Possible observations:

Animal appears conscious
Possible bleeding
Unable to stand
Leg injury detected
Bird appears trapped

Important: The app clearly states:

"AI observations are informational only and do not replace professional veterinary assessment."

4.10 GPS Location Card

Automatically opens GPS.

Display:

Static map

Address

Latitude

Longitude

GPS accuracy

Altitude (optional)

Nearest landmark (if detected)

Buttons

Refresh Location

Edit

Choose on Map

Drop Pin

If GPS denied

Message

Location permission required for accurate rescue assistance.

Button

Enable Location

Manual entry always available.

4.11 Animal Information

Animal Type

Single selection chips.

🐶 Dog

🐱 Cat

🐄 Cow

🐴 Horse

🐐 Goat

🐑 Sheep

🐇 Rabbit

🦜 Bird

🐒 Monkey

🐍 Snake

🐢 Turtle

🦌 Deer

🦚 Peacock

🦊 Fox

🐘 Elephant

🐅 Tiger

🦁 Lion

🐻 Bear

🐺 Wolf

🐪 Camel

🦓 Zebra

🦒 Giraffe

🐬 Marine Animal

🦅 Wildlife

Other

Selecting Other opens text input.

4.12 Animal Details

Optional fields

Species

Breed

Estimated Age

Gender

Color

Size

Collar Present?

Tag Present?

Microchip Known?

Pregnant?

Mother with Babies?

These help rescuers prepare appropriately.

4.13 Current Condition

Multiple selection chips.

Injured

Bleeding

Broken Bone

Unable to Walk

Unconscious

Burned

Poisoned

Weak

Malnourished

Abandoned

Hit by Vehicle

Trapped

Pregnant

Newborn

Aggressive

Sick

Heat Stroke

Cold Exposure

Eye Injury

Ear Injury

Breathing Difficulty

Fracture

Paralyzed

Other

Selected chips appear highlighted.

4.14 Urgency Level

Large selectable cards.

Only one active.

Low

Animal appears safe.

Minor concern.

Can wait.

Green.

Medium

Needs rescue.

Stable.

Should be assisted soon.

Yellow.

High

Serious injury.

Immediate rescue recommended.

Orange.

Critical

Life-threatening.

Heavy bleeding.

Unconscious.

Hit by vehicle.

Red flashing border.

4.15 Description

Large text area.

Placeholder

Describe:

What happened
Animal behavior
Visible injuries
Nearby dangers
Traffic conditions
Whether the animal can move

Maximum

1000 characters

Minimum

20

Features

Character counter

Voice-to-text

Auto-save draft

Grammar correction (optional)

Translate to rescue language (optional)

4.16 Nearby Landmark

Optional

Examples

Near temple

Near school

Near bus stop

Beside lake

Opposite hospital

Helps volunteers locate the animal quickly.

4.17 Contact Preferences

Checkbox

Allow volunteers to contact me

If enabled

Phone

WhatsApp

In-app chat

Relay phone number through app

Hide personal number

Anonymous Reporting toggle

4.18 Emergency Information (Automatic)

Automatically records:

Current Time

Current Date

Battery Percentage (optional)

Network Type

Internet Strength

GPS Accuracy

Device Language

App Version

These assist with troubleshooting and rescue coordination.

4.19 Safety Card

Blue information card.

Message

Do not attempt to move severely injured or aggressive animals unless it is safe to do so. Wait for trained volunteers whenever possible.

Includes link:

View First Aid Guide

4.20 Emergency Summary

Before submission, show a review screen.

Summary includes:

Emergency Type
Animal Type
Conditions
Urgency
Photos
Location
Landmark
Contact Preferences
Description

Users can edit any section before confirming.

4.21 Confirm SOS Button

Large full-width button.

Text

🚨 Confirm SOS

Disabled until:

✔ Location available

✔ Animal selected

✔ Urgency selected

✔ Description entered

When enabled:

Red gradient

Soft pulse animation

4.22 Confirmation Dialog

Title

Submit Rescue Alert?

Message

Your report will be shared with nearby volunteers, veterinarians, NGOs, and rescue organizations.

Buttons

Cancel

Submit SOS

4.23 Submission Process

Animated progress screen.

Steps:

Uploading Photos

↓

Saving GPS

↓

Creating Rescue Case

↓

Generating Case ID

↓

Finding Nearby Volunteers

↓

Sending Notifications

↓

Updating Dashboard

↓

Success

Estimated completion:

3–8 seconds

4.24 Success Screen

Large success illustration.

Happy rescued puppy.

Title

SOS Report Submitted Successfully

Subtitle

Nearby volunteers have been notified.

Display:

Case ID

Estimated Response Time

Distance to nearest volunteer

Buttons

Track Rescue

Return Home

View Active Alert

Share Report (optional)

4.25 Real-Time Rescue Tracking

After submission, users can monitor progress.

Timeline:

Report Submitted

↓

Volunteer Assigned

↓

Volunteer En Route

↓

Reached Location

↓

Animal Rescued

↓

Taken to Vet/Shelter

↓

Treatment Completed

↓

Case Resolved

Each stage includes:

Timestamp

Volunteer name (if public)

Estimated arrival

Photos

Notes

4.26 Notifications

Reporter receives updates for:

Volunteer accepted

Volunteer arrived

Animal rescued

Animal admitted

Case completed

Additional information requested

Notifications appear via push notification, in-app alerts, and email (optional).

4.27 Offline Mode

If no internet:

Report saved locally.

GPS retained.

Images cached.

Queue created.

Automatic upload begins when connection returns.

User can also retry manually.

4.28 Error Handling

Examples:

GPS unavailable
Camera permission denied
Upload failed
Network lost
Server unavailable
Duplicate report detected

Each error provides:

Explanation

Retry

Save Draft

Continue Offline (when possible)

4.29 Anti-Spam & Duplicate Detection

To maintain system reliability:

Detect duplicate reports within a configurable radius and time window.
Suggest joining an existing rescue case instead of creating another.
Rate-limit repeated submissions.
Flag suspicious activity for moderator review.
Require verification for repeated abuse of the reporting system.

Legitimate emergencies must always remain easy to report.

4.30 Accessibility

The SOS workflow supports:

Screen readers
Voice input
Large buttons
High contrast mode
Color-independent urgency indicators (icons + labels)
Simple language
One-handed operation where possible
4.31 Performance Requirements
Screen opens in under 1 second.
GPS starts immediately.
Image uploads use compression while preserving useful detail.
Drafts auto-save every few seconds.
Rescue case appears on the Active Alerts page almost instantly after successful submission.
Real-time updates synchronize without requiring manual refresh.
4.32 Backend Data Model

Each SOS report should create a rescue case containing at minimum:

Case ID (unique)
Report ID
Reporter ID
Reporter Name
Animal Type
Emergency Type
Animal Details
Condition Tags
Urgency Level
Description
Image List
Latitude
Longitude
Address
Nearest Landmark
Timestamp
Current Status
Assigned Volunteer
Assigned NGO
Assigned Veterinarian
Rescue Timeline
Before Rescue Images
After Rescue Images
Rescue Notes
Resolution Time
Final Outcome
4.33 Acceptance Criteria

The SOS Module is considered complete when:

Reports can be submitted in under one minute.
Users can attach multiple images.
GPS is captured automatically with manual override.
Offline reporting works reliably.
Nearby responders are notified in real time.
Every case receives a unique tracking ID.
Reporters can monitor rescue progress until resolution.
Duplicate reports are minimized without blocking genuine emergencies.
Accessibility and performance requirements are met.
End of Chapter 4

This chapter defines the complete Emergency SOS and Intelligent Rescue Reporting System, which serves as the operational core of AnimaAid. It transforms emergency observations into structured rescue cases with real-time coordination, transparent tracking, and support for volunteers, veterinarians, NGOs, and shelters. The next chapter will specify the Active Rescue Alerts & Volunteer Response Module, covering alert management, rescue workflows, volunteer actions, and case resolution in detail.