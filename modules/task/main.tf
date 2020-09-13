resource "twilio_autopilot_task" "task" {
  assistant_sid = var.assistant_sid
  unique_name   = var.name
  friendly_name = var.name
  actions       = var.actions
  actions_url   = var.actions_url
}

module "task_fields" {
  for_each = { for field in var.fields : field.name => field }
  source   = "../task_field"

  assistant_sid    = var.assistant_sid
  task_sid         = twilio_autopilot_task.task.sid
  name             = each.value.name
  built_in_type    = each.value.type.built_in
  custom_type      = each.value.type.custom
  default_language = var.default_language
}

resource "twilio_autopilot_task_sample" "task_sample" {
  for_each = { for sample in var.samples : sample.tagged_text => sample }

  assistant_sid  = var.assistant_sid
  task_sid       = twilio_autopilot_task.task.sid
  language       = each.value.language_override != null ? each.value.language_override : var.default_language
  tagged_text    = each.value.tagged_text
  source_channel = each.value.source_channel

  depends_on = [
    module.task_fields
  ]
}
