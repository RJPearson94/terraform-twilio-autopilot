output "assistant" {
  description = "The generated Autopilot assistant"
  value       = twilio_autopilot_assistant.assistant
}

output "webhooks" {
  description = "The generated Autopilot assistant webhooks"
  value       = twilio_autopilot_webhook.webhook
}
