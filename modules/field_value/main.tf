resource "twilio_autopilot_field_value" "field_value" {
  assistant_sid  = var.assistant_sid
  field_type_sid = var.field_type_sid
  language       = var.language_override != null ? var.language_override : var.default_language
  value          = var.value
}

resource "twilio_autopilot_field_value" "synonym_field_value" {
  for_each = { for synonym in var.synonyms : synonym.value => synonym }

  assistant_sid  = var.assistant_sid
  field_type_sid = var.field_type_sid
  language       = each.value.language_override != null ? each.value.language_override : var.default_language
  value          = each.value.value
  synonym_of     = twilio_autopilot_field_value.field_value.sid
}
