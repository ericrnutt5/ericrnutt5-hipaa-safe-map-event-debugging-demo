# Simplified Analytics Flow

```text
Patient Browser
      ↓
Healthcare Website + Embedded Map
      ↓
Frontend Analytics Event
      ↓
Backend Sanitization Layer
      ↓
Analytics Destination
```

## Risk Area

Frontend analytics payloads may accidentally contain:
- email addresses
- appointment information
- patient identifiers
- location metadata

## Mitigation Strategy

A sanitization layer removes or filters restricted fields before data reaches analytics destinations.
```