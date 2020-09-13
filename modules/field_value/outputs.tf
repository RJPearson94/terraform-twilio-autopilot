output "field_value" {
  description = "The generated Autopilot field value"
  value       = twilio_autopilot_field_value.field_value
}

output "synonyms" {
  description = "The generated Autopilot synonym field values"
  value       = twilio_autopilot_field_value.synonym_field_value
}

output "change_hash" {
  description = "Computed hash which can be used to determine if the resources have changed"
  value = sha1(join(",", flatten([
    list(sha1(join(",", list(twilio_autopilot_field_value.field_value.sid, twilio_autopilot_field_value.field_value.language, twilio_autopilot_field_value.field_value.value)))),
    [for synonym in twilio_autopilot_field_value.synonym_field_value : sha1(join(",", list(synonym.sid, synonym.language, synonym.value, synonym.synonym_of)))],
  ])))
}
