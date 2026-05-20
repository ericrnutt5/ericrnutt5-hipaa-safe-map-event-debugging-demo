# Incident Report: PHI Exposure Risk in Healthcare Map Analytics

## Summary

A healthcare customer reported concerns regarding potential PHI exposure within analytics events generated from embedded provider map interactions.

---

## Investigation

The investigation reviewed:

- Frontend analytics payload generation
- Backend sanitization behavior
- Analytics event records stored downstream

Frontend event payloads were found to include the field:

- patient_email

This field was transmitted before sanitization occurred.

---

## Root Cause

The frontend analytics workflow generated outbound events containing patient identifiers prior to execution of backend sanitization logic.

This created risk of PHI exposure to non-HIPAA analytics destinations.

---

## Resolution

Implemented backend sanitization logic to remove sensitive identifiers before transmission to downstream analytics platforms.

Validated sanitized event payloads no longer contained:
- patient_email
- direct patient identifiers

---

## Prevention Recommendations

- Introduce allowlist-based payload validation
- Audit analytics events regularly
- Separate HIPAA and non-HIPAA destinations
- Add automated monitoring for restricted fields
- Improve documentation for analytics instrumentation standards

---

## Outcome

The issue was resolved successfully and analytics event flows were validated against updated privacy requirements.