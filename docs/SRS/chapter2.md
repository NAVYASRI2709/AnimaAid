Authentication, Onboarding & Navigation System

Version: 1.0

Project: AnimaAid

Purpose

The Authentication and Onboarding module is the user's first interaction with AnimaAid. Its purpose is to build trust, make registration effortless, request only the permissions that are genuinely needed, and help users understand the app before they begin using it.

The experience should feel welcoming, modern, accessible, and reassuring while minimizing friction during account creation.

Design Philosophy

The authentication experience should:

Feel friendly and trustworthy.
Require as few steps as possible.
Support both new and returning users.
Clearly explain why permissions are requested.
Work well for users with limited technical knowledge.
Follow Material Design 3 principles.
Be fully responsive on Android and iOS.
Complete User Journey
Splash Screen
       ↓
Welcome Screens
       ↓
Choose Language
       ↓
Sign In / Register
       ↓
Verify Email or OTP
       ↓
Location Permission
       ↓
Notification Permission
       ↓
Optional Volunteer Registration
       ↓
Home Dashboard
Splash Screen
Duration

2–3 seconds.

Layout

Center:

AnimaAid Logo

Below logo

AnimaAid

Tagline

Every Life Matters. Every Rescue Counts.

Bottom

Loading indicator

Version number

Background

Soft cream gradient fading into light mint.

Decorated with faint paw prints and leaf motifs.

Cute illustrations of:

Puppy
Kitten
Rabbit
Bird

Positioned subtly around the edges without distracting from the logo.

Animation
Logo gently scales in.
Paw prints softly fade into view.
Mascot (Dr. Paws) waves once.
Tagline fades upward.
Smooth transition to onboarding.
Onboarding

Purpose:

Introduce users to the app's key features in under one minute.

Users may:

Swipe manually.
Skip onboarding.
Return to it later from Settings.
Screen 1 – Rescue

Illustration:

A volunteer gently helping an injured puppy.

Heading:

Report Emergencies in Seconds

Description:

Report injured, trapped, abused, or abandoned animals with photos and location to alert nearby rescuers quickly.

Primary Button:

Next

Secondary:

Skip

Screen 2 – Care

Illustration:

Dr. Paws showing a first-aid kit beside a cat.

Heading:

Learn Emergency First Aid

Description:

Access an extensive offline first-aid guide covering common emergencies before professional veterinary care.

Buttons:

Next

Skip

Screen 3 – Community

Illustration:

People, vets, NGOs, and volunteers surrounding rescued animals.

Heading:

Together We Save Lives

Description:

Connect with volunteers, veterinarians, NGOs, shelters, and fellow animal lovers through one trusted platform.

Button:

Get Started

Language Selection

Appears during first launch.

Supported Languages

English
Hindi
Tamil
Telugu
Kannada
Malayalam
Marathi
Bengali
Gujarati
Punjabi

More languages can be downloaded later.

User can change language anytime.

Authentication Options

Users may choose:

Email
Mobile Number (OTP)
Google Sign-In
Apple Sign-In (iOS)
Continue as Guest (limited functionality)
Guest Mode

Guest Mode allows users to:

✔ Browse first-aid guide

✔ View nearby services

✔ Read rescue tips

Restrictions:

❌ Cannot report SOS

❌ Cannot donate

❌ Cannot volunteer

❌ Cannot post in community

The app gently encourages account creation when needed.

Sign In Screen
Layout

Top Illustration

Friendly illustration of a puppy and kitten sitting together.

Large Title

Welcome Back!

Subtitle

Sign in to continue helping animals.

Input Fields

Email or Mobile Number

Password (if using email)

Forgot Password?

Remember Me checkbox

Buttons

Primary

Sign In

Secondary

Continue with Google

Continue with Apple (iOS)

Continue as Guest

Bottom

Don't have an account?

Create Account

Registration

Minimal registration.

Required:

Name
Email OR Mobile
Password
Confirm Password

Optional:

Profile photo

City

Preferred language

Password Requirements

Minimum:

8 characters

At least:

One uppercase
One lowercase
One number
One special character

Live password strength indicator:

Weak

Medium

Strong

Excellent

OTP Verification

For mobile users:

6-digit OTP
Auto-read OTP (Android)
Manual entry
Countdown timer
Resend OTP
Email Verification

Email users receive a verification link.

App waits until verified before enabling reporting features.

Forgot Password

Methods:

Email reset link

OR

OTP verification

Clear success messages are shown.

Permission Flow

Permissions are never requested all at once.

Each permission is explained before the system dialog appears.

Location Permission

Illustration:

Map with a rescue pin.

Heading:

Allow Location Access

Explanation:

Location helps rescuers find animals faster and enables nearby vets, shelters, and NGOs.

Buttons:

Allow

Not Now

If denied:

Users can still use most features, but SOS reporting will require manual location entry.

Notification Permission

Illustration:

Bell with paw icon.

Purpose:

Receive rescue updates, volunteer requests, report status, and emergency alerts.

Buttons:

Enable

Later

Camera Permission

Requested only when uploading a photo.

Explanation:

Needed to capture images of animals requiring assistance.

Gallery Permission

Requested only when selecting existing images.

Microphone Permission

Requested only when using voice-to-text.

Volunteer Registration Prompt

After sign-in, users are asked:

Would you like to become a verified volunteer?

Buttons:

Become a Volunteer

Maybe Later

This step is optional.

Navigation System

Bottom Navigation Bar (5 Tabs)

🏠 Home

🗺 Nearby

🚨 SOS

📋 Reports

👤 Profile

The SOS button is larger and centered.

Side Navigation Drawer

Accessible from the Home screen.

Contains:

Home
SOS
Active Alerts
First Aid Guide
Nearby Vets
Nearby NGOs
Nearby Shelters
Community
Donations
Volunteer Dashboard
AI Assistant (Dr. Paws)
Settings
Help
About
Privacy Policy
Logout
Navigation Principles
No screen should be more than three taps away.
The Back button should always behave predictably.
Important actions (SOS, First Aid, Nearby Help) should always be easy to reach.
Smooth transitions between screens.
Large touch targets for accessibility.
Session Management
Users remain signed in until they log out.
Secure token refresh in the background.
Biometric login (fingerprint/Face ID) can be enabled in Settings.
Automatic logout after prolonged inactivity can be configured by the user.
Security Considerations
Passwords are never stored in plain text.
Authentication uses secure industry standards (e.g., Firebase Authentication or OAuth providers).
Sensitive operations require a valid authenticated session.
Users can view and manage active sessions from their profile.
Error States

Examples:

Invalid email format
Incorrect password
OTP expired
Network unavailable
Verification failed
Account already exists

Each error message should be clear, actionable, and avoid technical jargon.

Success States

Examples:

Account created successfully
Email verified
Phone verified
Logged in successfully
Password reset email sent

Success messages should be accompanied by subtle animations and positive reinforcement.

Offline Behavior
Previously authenticated users can continue using offline features.
Login and registration require internet access.
If connectivity is lost during authentication, the app should save entered data temporarily and allow the user to retry without re-entering everything.
Acceptance Criteria

This chapter is considered complete when:

Users can sign in using all supported methods.
Onboarding is skippable and replayable.
Permissions are requested contextually.
Navigation is intuitive and consistent.
Authentication is secure.
Guest mode functions correctly.
Accessibility guidelines are met.
The user reaches the Home Dashboard smoothly after setup.