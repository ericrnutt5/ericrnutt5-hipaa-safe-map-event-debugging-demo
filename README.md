# HIPAA-Safe Map Event Debugging Demo

This repository simulates a real-world support engineering investigation involving protected health information (PHI) exposure risks within healthcare analytics workflows.

The project demonstrates how frontend analytics events generated from embedded healthcare maps can unintentionally expose sensitive data, and how backend sanitization, SQL investigation, and technical incident response workflows can be used to identify and remediate the issue.

## Project Goals

This project demonstrates:

- Cross-stack troubleshooting and debugging
- Frontend analytics event investigation
- Backend sanitization logic
- SQL-based issue investigation
- Technical incident documentation
- Healthcare privacy and PHI awareness
- Customer-focused technical problem solving

---

# Simulated Architecture

```text
Patient Browser
      ↓
Healthcare Website + Embedded Map
      ↓
Analytics Event Payload
      ↓
Privacy/Sanitization Layer
      ↓
Analytics Destination
```

---

# Scenario

A healthcare customer reports concerns that PHI may be leaking into analytics platforms through embedded map interactions on their website.

A support engineer investigates the issue by:

1. Reviewing frontend event payloads
2. Identifying sensitive fields
3. Validating backend sanitization behavior
4. Querying analytics event data
5. Documenting root cause and remediation steps

---

# Planned Components

## frontend/mapEvent.js
Simulates frontend analytics events generated from healthcare map interactions.

## backend/sanitize.go
Simulates backend sanitization logic removing PHI before transmission.

## sql/investigate_phi.sql
SQL investigation query identifying analytics events containing PHI.

## docs/incident_report.md
Technical support incident documentation covering:
- investigation
- root cause
- remediation
- prevention recommendations

---

# Key Focus Areas

This project focuses on demonstrating:

- Technical troubleshooting
- Debugging workflows
- Data privacy awareness
- Support engineering mindset
- Cross-functional communication
- Healthcare analytics risk mitigation

---

# Running the Demo

### Prerequisites

- Node.js installed (for JavaScript execution)
- Go installed (for backend simulation)

### Frontend Event Simulation

```bash
cd frontend
node mapEvent.js
```

### Backend Sanitization Demo

```bash
cd backend
go run sanitize.go
```

## Expected Output

### Frontend Output

When running `mapEvent.js`, you should see:

- The full analytics event payload printed
- A warning indicating potential PHI detection

Example:

Outgoing analytics payload:
{
  event: "Viewed Oncology Clinic",
  clinic_name: "Austin Cancer Center",
  patient_email: "patient@email.com",
  zip_code: "78704",
  timestamp: "..."
}

WARNING: PHI detected in analytics payload.

### Backend Output

When running `sanitize.go`, you should see:

- Original event containing patient_email
- Sanitized event with sensitive fields removed

Example:

Original Event:
map[clinic_name:Austin Cancer Center event:Viewed Oncology Clinic patient_email:patient@email.com zip_code:78704]

Sanitized Event:
map[clinic_name:Austin Cancer Center event:Viewed Oncology Clinic zip_code:78704]

## Quick Verification Checklist

If everything is set up correctly:

### Frontend
- Event payload prints successfully
- PHI warning appears in console

### Backend
- Original event includes patient_email
- Sanitized output removes patient_email

## Key Investigation Concepts

This project simulates real support engineering workflows including:

### 1. Frontend Data Leakage
Analytics events may unintentionally include PHI before sanitization.

### 2. Backend Sanitization Layer
Sensitive fields are removed before data is transmitted to external systems.

### 3. Cross-System Debugging
Issues are traced across frontend → backend → analytics pipeline.

### 4. SQL-Based Investigation
Support engineers validate whether PHI has reached downstream systems.

## SQL Investigation Overview

The included SQL queries simulate:

- Detection of direct PHI fields (email, phone, name)
- Pattern-based detection of sensitive data in event payloads
- Location-based sensitivity analysis (geo + ZIP data)
- Risk scoring across multiple signals
- Aggregation of exposure by analytics destination
