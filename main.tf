module "autopilot_assistant" {
  source = "./modules/assistant"

  assistant_name    = var.assistant_name
  stylesheet        = var.stylesheet
  defaults          = var.defaults
  enable_logging    = var.enable_logging
  development_stage = var.development_stage
  callback          = var.callback
  webhooks          = var.webhooks
}

module "autopilot_tasks" {
  for_each = { for task in var.tasks : task.name => task }
  source   = "./modules/task"

  assistant_sid    = module.autopilot_assistant.assistant.sid
  default_language = var.default_language
  name             = each.value.name
  actions          = each.value.actions != null ? each.value.actions.json : null
  actions_url      = each.value.actions != null ? each.value.actions.url : null
  fields           = each.value.fields
  samples          = each.value.samples
}

resource "twilio_autopilot_model_build" "model_build" {
  assistant_sid = module.autopilot_assistant.assistant.sid

  triggers = {
    redeployment = sha1(join(",", [for task in module.autopilot_tasks : task.change_hash]))
  }

  depends_on = [
    module.autopilot_tasks.task,
    module.autopilot_tasks.task_fields,
    module.autopilot_tasks.task_samples
  ]

  polling {
    enabled      = var.polling.enabled
    max_attempts = var.polling.max_attempts
    delay_in_ms  = var.polling.delay_in_ms
  }
}
