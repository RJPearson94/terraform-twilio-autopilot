resource "twilio_autopilot_task_field" "task_field" {
  assistant_sid = var.assistant_sid
  task_sid      = var.task_sid
  unique_name   = var.name
  field_type    = var.custom_type != null ? element(twilio_autopilot_field_type.field_type.*.sid, 1) : var.built_in_type
}

resource "twilio_autopilot_field_type" "field_type" {
  count = var.custom_type == null ? 0 : 1

  assistant_sid = var.assistant_sid
  unique_name   = var.custom_type.name
  friendly_name = var.custom_type.name
}

module "field_values" {
  for_each = { for value in var.custom_type == null ? [] : var.custom_type.values : value.value => value }
  source   = "../field_value"

  assistant_sid     = var.assistant_sid
  field_type_sid    = element(twilio_autopilot_field_type.field_type.*.sid, 1)
  language_override = each.value.language_override
  default_language  = var.default_language
  value             = each.value.value
  synonyms          = each.value.synonyms
}
