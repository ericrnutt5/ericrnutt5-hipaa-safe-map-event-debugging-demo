package main

import "fmt"

func sanitizeEvent(event map[string]string) map[string]string {

	// Remove sensitive healthcare identifiers
	delete(event, "patient_email")

	return event
}

func main() {

	event := map[string]string{
		"event":         "Viewed Oncology Clinic",
		"clinic_name":   "Austin Cancer Center",
		"patient_email": "patient@email.com",
		"zip_code":      "78704",
	}

	fmt.Println("Original Event:")
	fmt.Println(event)

	sanitized := sanitizeEvent(event)

	fmt.Println("\nSanitized Event:")
	fmt.Println(sanitized)
}