output "task" {
  description = "The generated Autopilot task"
  value       = twilio_autopilot_task.task
}

output "task_action" {
  description = "The generated Autopilot task"
  value       = var.actions
}

output "task_fields" {
  description = "The generated task fields"
  value       = module.task_fields
}

output "task_samples" {
  description = "The generated Autopilot task samples"
  value       = twilio_autopilot_task_sample.task_sample
}

output "change_hash" {
  description = "Computed hash which can be used to determine if the resources have changed"
  value = sha1(join(",", flatten([
    list(twilio_autopilot_task.task.sid),
    [for task_field in module.task_fields : task_field.change_hash],
    [for task_sample in twilio_autopilot_task_sample.task_sample : sha1(join(",", list(task_sample.sid, task_sample.language, task_sample.tagged_text)))],
  ])))
}
