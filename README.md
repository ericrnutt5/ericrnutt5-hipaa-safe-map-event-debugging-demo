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

## frontend/mapEvent.ts
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
