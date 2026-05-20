package main

import "fmt"

func sanitizeEvent(event map[string]string) map[string]string {

	// Remove sensitive healthcare identifiers / potential PHI
	sensitiveFields := []string{
		"patient_email",
		"patient_phone",
		"patient_name",
		"ip_address",
		"latitude",
		"longitude",
		"date_of_birth",
		"medical_record_number",
		"insurance_id",
	}

	for _, field := range sensitiveFields {
		delete(event, field)
	}

	return event
}

func main() {

	event := map[string]string{
		"event":                 "Viewed Oncology Clinic",
		"clinic_name":           "Austin Cancer Center",
		"patient_email":         "patient@email.com",
		"patient_phone":         "512-555-1234",
		"patient_name":          "Jane Doe",
		"ip_address":            "192.168.1.15",
		"latitude":              "30.2672",
		"longitude":             "-97.7431",
		"medical_record_number": "MRN-48291",
		"insurance_id":          "INS-77821",
		"zip_code":              "78704",
	}

	fmt.Println("Original Event:")
	fmt.Println(event)

	sanitized := sanitizeEvent(event)

	fmt.Println("\nSanitized Event:")
	fmt.Println(sanitized)
}