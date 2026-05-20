interface AnalyticsEvent {
    event: string;
    clinic_name: string;
    patient_email?: string;
    zip_code: string;
    timestamp: string;
  }
  
  const mapInteractionEvent: AnalyticsEvent = {
    event: "Viewed Oncology Clinic",
    clinic_name: "Austin Cancer Center",
    patient_email: "patient@email.com",
    zip_code: "78704",
    timestamp: new Date().toISOString()
  };
  
  console.log("Outgoing analytics payload:");
  console.log(mapInteractionEvent);
  
  function validatePayload(event: AnalyticsEvent): void {
    if (event.patient_email) {
      console.warn("WARNING: PHI detected in analytics payload.");
    }
  }
  
  validatePayload(mapInteractionEvent);
  
  /*
  ISSUE IDENTIFIED:
  
  The analytics payload includes patient_email,
  which may qualify as protected health information (PHI)
  in a healthcare analytics environment.
  
  This payload should be sanitized before being sent
  to third-party analytics destinations.
  */