-- PHI/PII/Sensitive Data Leakage Investigation for Healthcare Analytics Events
-- Support Engineer Debugging Scenario

-- Objective:
-- Identify potential PHI/PII/Sensitive Data leakage across analytics events
-- sent to third-party destinations.

------------------------------------------------------------
-- 1. Detect direct PII indicators (email, phone, name patterns)
------------------------------------------------------------

SELECT
    event_name,
    user_id,
    patient_email,
    patient_phone,
    full_name,
    analytics_destination,
    created_at
FROM analytics_events
WHERE
    patient_email IS NOT NULL
    OR patient_phone IS NOT NULL
    OR full_name IS NOT NULL;

------------------------------------------------------------
-- 2. Detect possible PHI in free-text fields using pattern matching
------------------------------------------------------------

SELECT
    event_name,
    event_properties,
    analytics_destination
FROM analytics_events
WHERE
    event_properties LIKE '%@%'                          -- emails
    OR event_properties REGEXP '[0-9]{3}-[0-9]{2}-[0-9]{4}'  -- SSN pattern
    OR event_properties REGEXP '[0-9]{3}-[0-9]{3}-[0-9]{4}'; -- phone pattern

------------------------------------------------------------
-- 3. Detect location-based PHI risk (fine-grained geo data)
------------------------------------------------------------

SELECT
    event_name,
    latitude,
    longitude,
    zip_code,
    analytics_destination
FROM analytics_events
WHERE
    latitude IS NOT NULL
    AND longitude IS NOT NULL
    AND analytics_destination IN ('Google Analytics', 'Facebook', 'Amplitude');

------------------------------------------------------------
-- 4. Identify high-risk event payloads (multi-signal scoring)
------------------------------------------------------------

SELECT
    event_name,
    analytics_destination,

    CASE
        WHEN patient_email IS NOT NULL THEN 3
        ELSE 0
    END +

    CASE
        WHEN patient_phone IS NOT NULL THEN 3
        ELSE 0
    END +

    CASE
        WHEN full_name IS NOT NULL THEN 2
        ELSE 0
    END +

    CASE
        WHEN event_properties LIKE '%appointment%' THEN 2
        ELSE 0
    END +

    CASE
        WHEN latitude IS NOT NULL AND longitude IS NOT NULL THEN 1
        ELSE 0
    END AS phi_risk_score

FROM analytics_events
ORDER BY phi_risk_score DESC;

------------------------------------------------------------
-- 5. High-confidence PHI leakage into external tools
------------------------------------------------------------

SELECT
    analytics_destination,
    COUNT(*) AS events_with_potential_phi
FROM analytics_events
WHERE
    patient_email IS NOT NULL
    OR patient_phone IS NOT NULL
    OR full_name IS NOT NULL
GROUP BY analytics_destination
ORDER BY events_with_potential_phi DESC;

------------------------------------------------------------
-- NOTES:

-- This query simulates how a support engineer at a
-- healthcare analytics company might investigate:

-- 1. Structured PHI leakage (columns)
-- 2. Unstructured PHI leakage (event payloads)
-- 3. Location-based sensitivity risks
-- 4. Risk scoring across multiple signals
-- 5. Destination-level exposure analysis

-- In real systems, this logic would often map to:
-- - data loss prevention (DLP) rules
-- - event pipeline validation
-- - privacy compliance auditing