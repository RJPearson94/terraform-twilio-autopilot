locals {
  development_stage = var.development_stage ? "in-development" : "in-production"
}

resource "twilio_autopilot_assistant" "assistant" {
  unique_name       = var.assistant_name
  friendly_name     = var.assistant_name
  stylesheet        = var.stylesheet
  defaults          = var.defaults
  log_queries       = var.enable_logging
  development_stage = local.development_stage
  callback_url      = var.callback != null ? var.callback.url : null
  callback_events   = var.callback != null ? var.callback.events : null
}

resource "twilio_autopilot_webhook" "webhook" {
  for_each = { for webhook in var.webhooks : webhook.name => webhook }

  assistant_sid  = twilio_autopilot_assistant.assistant.sid
  unique_name    = each.value.name
  webhook_url    = each.value.url
  webhook_method = each.value.method
  events         = each.value.events
}
