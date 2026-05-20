const mapInteractionEvent = {
  event: "Viewed Oncology Clinic",
  clinic_name: "Austin Cancer Center",
  patient_email: "patient@email.com",
  zip_code: "78704",
  timestamp: new Date().toISOString()
};

console.log("Outgoing analytics payload:");
console.log(mapInteractionEvent);

function validatePayload(event) {
  if (event.patient_email) {
    console.warn("WARNING: PHI detected in analytics payload.");
  }
}

validatePayload(mapInteractionEvent);