-- Investigate analytics events containing PHI

SELECT
    event_name,
    patient_email,
    analytics_destination,
    created_at
FROM analytics_events
WHERE patient_email IS NOT NULL
AND analytics_destination = 'Google Analytics';

-- Root Cause Investigation:
-- Frontend analytics events included patient_email
-- before backend sanitization occurred.

-- Recommended Remediation:
-- 1. Remove PHI fields before transmission
-- 2. Introduce payload allowlist validation
-- 3. Audit healthcare analytics destinations regularly