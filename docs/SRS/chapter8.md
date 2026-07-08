Chapter 8 – Data Architecture & Database Design
8.1 Purpose

This chapter defines the complete data architecture of the AnimaAid platform.

The database must be designed to support:

millions of users
millions of pets
real-time AI services
veterinary records
appointment management
emergency services
community interactions
e-commerce
donations
shelters
adoption services
AI health history
vaccination records
analytics
notifications
future expansion

The system shall use a highly scalable relational database combined with cloud storage for media assets and optimized caching for frequently accessed data.

8.2 Database Architecture
Primary Database

Recommended:

PostgreSQL

Alternative

MySQL

Reason:

ACID compliance
reliability
transactions
JSON support
scalability
Cache

Redis

Used for

login sessions
AI cache
emergency requests
OTP validation
frequently viewed pets
trending community posts
search suggestions
Media Storage

Cloud Object Storage

Stores

pet images
medical reports
prescriptions
vaccination certificates
adoption documents
invoices
user profile images
shelter documents
AI generated reports
Search Engine

Elasticsearch

Used for

pet search
breed search
symptom search
adoption search
vet search
product search
community search
8.3 High Level Database Diagram
User
 │
 ├── Pets
 │      │
 │      ├── Medical Records
 │      ├── Vaccinations
 │      ├── Medications
 │      ├── AI Health Reports
 │      ├── Appointments
 │      ├── Insurance
 │      └── Emergency History
 │
 ├── Orders
 ├── Donations
 ├── Community Posts
 ├── Messages
 ├── Notifications
 ├── Favorites
 └── Settings

Shelter
 ├── Animals
 ├── Adoption Requests
 └── Donations

Veterinarian
 ├── Appointments
 ├── Prescriptions
 ├── Medical Notes

Marketplace
 ├── Products
 ├── Orders
 ├── Reviews
8.4 User Entity

Stores all registered users.

Fields
UserID (UUID)

FullName

Email

PhoneNumber

PasswordHash

Role

ProfilePhoto

DateOfBirth

Gender

Country

State

City

PreferredLanguage

Timezone

EmailVerified

PhoneVerified

AccountStatus

RegistrationDate

LastLogin

NotificationSettings

PrivacySettings

SubscriptionType

RewardPoints

ReferralCode

EmergencyContact

CreatedAt

UpdatedAt
Roles
Pet Owner
Veterinarian
Shelter
NGO
Volunteer
Admin
Moderator
Delivery Partner
Store Owner
8.5 Pet Entity

Each user can own multiple pets.

Fields
PetID

OwnerID

Name

Species

Breed

Gender

Age

Weight

Height

Color

MicrochipID

VaccinationStatus

InsuranceStatus

Photo

BirthDate

AdoptionDate

FavoriteFood

MedicalConditions

BehaviorTraits

Neutered

SpecialNeeds

EmergencyNotes

CreatedAt

UpdatedAt
Relationships

One User

↓

Many Pets

8.6 Breed Table
BreedID

SpeciesID

BreedName

AverageWeight

AverageHeight

LifeExpectancy

Temperament

EnergyLevel

CommonDiseases

DietRecommendations

ExerciseNeeds

GroomingNeeds
8.7 Species Table
SpeciesID

SpeciesName

ScientificName

AverageLifespan

Description

Examples

Dog

Cat

Rabbit

Bird

Hamster

Horse

Cow

Goat

Fish

Turtle

Snake

Exotic Pets

8.8 Medical Record Entity

Stores complete medical history.

Fields

RecordID

PetID

VetID

VisitDate

Symptoms

Diagnosis

Treatment

Prescription

Weight

Temperature

HeartRate

BloodPressure

LabReports

ScannedDocuments

NextVisit

DoctorNotes

CreatedAt
8.9 Vaccination Entity
VaccinationID

PetID

VaccineName

Manufacturer

DoseNumber

DateAdministered

DueDate

Veterinarian

CertificateFile

ReminderStatus
8.10 Medication Entity
MedicationID

PetID

MedicineName

Dosage

Frequency

StartDate

EndDate

Instructions

ReminderEnabled

CurrentStatus
8.11 AI Health Reports

Every AI analysis is stored.

ReportID

PetID

AIModelVersion

SymptomsEntered

UploadedImages

PredictedConditions

ConfidenceScore

UrgencyLevel

Recommendations

GeneratedTime

UserFeedback
8.12 Appointment Entity
AppointmentID

PetID

VetID

OwnerID

ClinicID

AppointmentDate

AppointmentTime

Status

Reason

ConsultationType

PrescriptionID

PaymentStatus

Notes

Status

Pending
Confirmed
Completed
Cancelled
Missed
Rescheduled
8.13 Emergency Requests
EmergencyID

PetID

OwnerID

GPSLocation

EmergencyType

Description

Photo

Video

AssignedVolunteer

AssignedVet

AmbulanceStatus

Priority

CreatedAt

ResolvedAt

Priority Levels

Critical

High

Medium

Low

8.14 Shelter Entity
ShelterID

ShelterName

LicenseNumber

OwnerName

Phone

Email

Address

City

State

Country

Capacity

CurrentAnimals

Rating

VerificationStatus

Documents

CreatedAt
8.15 Adoption Animal Entity
AnimalID

ShelterID

Species

Breed

Age

Gender

Vaccinated

Neutered

HealthStatus

Behavior

Photos

Videos

AdoptionFee

AvailabilityStatus
8.16 Adoption Request
RequestID

AnimalID

ApplicantID

ApplicationDate

Questionnaire

HomeInspectionStatus

InterviewStatus

ApprovalStatus

Notes

Approval Status

Pending

Approved

Rejected

Waiting List

Completed

8.17 Community Posts
PostID

AuthorID

Title

Content

Images

Videos

Tags

Likes

Comments

Shares

Views

Visibility

CreatedAt

Visibility

Public

Friends

Followers

Private

8.18 Comments
CommentID

PostID

AuthorID

Comment

CreatedAt

EditedAt
8.19 Marketplace Products
ProductID

SellerID

Category

ProductName

Description

Price

Discount

Stock

Brand

Images

Specifications

Rating

Reviews

CreatedAt
8.20 Orders
OrderID

BuyerID

SellerID

ProductID

Quantity

Price

Tax

ShippingCharge

TotalAmount

PaymentMethod

OrderStatus

TrackingNumber

CreatedAt

Order Status

Pending

Paid

Packed

Shipped

Out for Delivery

Delivered

Returned

Cancelled

Refunded

8.21 Donations
DonationID

DonorID

ShelterID

CampaignID

Amount

PaymentMethod

TransactionID

ReceiptURL

CreatedAt
8.22 Notification Table
NotificationID

UserID

Title

Message

Category

Priority

ReadStatus

CreatedAt

Categories

Emergency

Appointment

Reminder

Community

Adoption

Donation

Promotion

AI Alert

Security

8.23 Chat Messages
MessageID

ConversationID

SenderID

ReceiverID

MessageType

Message

MediaURL

Timestamp

ReadStatus

Message Types

Text

Image

Video

Voice

Document

Location

Prescription

Medical Report

8.24 Payment Records
PaymentID

UserID

Amount

Currency

Gateway

TransactionReference

Status

RefundStatus

InvoiceURL

CreatedAt
8.25 Audit Logs

Every action inside the application is logged.

LogID

UserID

Action

Module

IPAddress

Browser

Device

OperatingSystem

Timestamp
8.26 Analytics Database

Stores anonymous usage statistics.

Examples

Daily Active Users
Monthly Active Users
Screen Visits
Search Frequency
AI Usage Count
Emergency Requests
Most Common Diseases
Popular Breeds
Vaccination Completion Rate
Adoption Success Rate
Marketplace Revenue
8.27 Relationships Overview
User
 ├── Pets
 ├── Orders
 ├── Donations
 ├── Community Posts
 ├── Notifications
 ├── Chats

Pet
 ├── Medical Records
 ├── Vaccinations
 ├── AI Reports
 ├── Medications
 ├── Appointments
 ├── Emergency Requests

Shelter
 ├── Animals
 ├── Adoption Requests

Marketplace
 ├── Products
 ├── Orders

Veterinarian
 ├── Appointments
 ├── Medical Records
 ├── Prescriptions
8.28 Data Retention Policy
Data Type	Retention Period
User Account	Until deletion request + legal retention
Medical Records	Minimum 10 years (or as required by local regulations)
AI Health Reports	5 years by default; configurable by user
Appointments	7 years
Vaccination Records	Lifetime of the pet
Payment Records	8 years
Audit Logs	2 years
Chat Messages	2 years (unless deleted by policy)
Notifications	180 days
Analytics Data	Aggregated indefinitely; raw event data 2 years
8.29 Data Integrity Rules

The system shall enforce the following constraints:

Every user shall have a globally unique UUID.
Every pet must belong to exactly one owner at a time (ownership transfer is recorded as history).
Medical records cannot exist without a valid pet.
Vaccination due dates must be later than administration dates.
Orders cannot be marked as delivered before shipment.
Deleted records shall use soft deletion where legally appropriate to preserve referential integrity.
All timestamps shall be stored in UTC and converted to the user's local timezone in the application.
Foreign key constraints shall be enforced across all critical entities.
Sensitive fields (passwords, payment tokens) shall never be stored in plaintext.
8.30 Chapter Summary

This chapter establishes the foundational data architecture for AnimaAid, defining a scalable, secure, and extensible database model capable of supporting millions of users and pets. It specifies the core entities, relationships, storage layers, retention policies, and integrity rules required for AI-powered healthcare, emergency response, veterinary services, community engagement, adoption, marketplace operations, and future platform expansion while maintaining consistency, reliability, and long-term maintainability.