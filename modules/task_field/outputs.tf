output "task_field" {
  description = "The generated Autopilot task field"
  value       = twilio_autopilot_task_field.task_field
}

output "field_type" {
  description = "The generated Autopilot field type"
  value       = twilio_autopilot_field_type.field_type[*]
}

output "field_values" {
  description = "The generated field values"
  value       = module.field_values
}

output "change_hash" {
  description = "Computed hash which can be used to determine if the resources have changed"
  value = sha1(join(",", flatten([
    tolist([twilio_autopilot_task_field.task_field.sid]),
    tolist([twilio_autopilot_field_type.field_type[*].sid]),
    [for field_value in module.field_values : field_value.change_hash],
  ])))
}
