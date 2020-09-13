output "assistant" {
  description = "The generated Autopilot assistant"
  value       = module.autopilot_assistant.assistant
}

output "webhooks" {
  description = "The generated Autopilot webhooks"
  value       = module.autopilot_assistant.webhooks
}

output "tasks" {
  description = "The generated tasks"
  value       = module.autopilot_tasks
}

output "model_build" {
  description = "The generated Autopilot model build"
  value       = twilio_autopilot_model_build.model_build
}
