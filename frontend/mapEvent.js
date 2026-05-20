const mapInteractionEvent = {
  event: "Viewed Oncology Clinic",
  clinic_name: "Austin Cancer Center",
  patient_email: "patient@email.com",
  patient_phone: "512-555-1234",
  patient_name: "Jane Doe",
  zip_code: "78704",
  ip_address: "192.168.1.15",
  latitude: 30.2672,
  longitude: -97.7431,
  timestamp: new Date().toISOString()
};

console.log("Outgoing analytics payload:");
console.log(mapInteractionEvent);

function validatePayload(event) {
  const sensitiveFields = [
    "patient_email",
    "patient_phone",
    "patient_name",
    "ip_address",
    "latitude",
    "longitude",
    "date_of_birth",
    "medical_record_number",
    "insurance_id"
  ];

  const detectedFields = sensitiveFields.filter(
    field => event[field] !== undefined && event[field] !== null
  );

  if (detectedFields.length > 0) {
    console.warn(
      `WARNING: Potential PII/PHI detected in analytics payload: ${detectedFields.join(", ")}`
    );
  } else {
    console.log("Payload passed validation.");
  }
}

validatePayload(mapInteractionEvent);