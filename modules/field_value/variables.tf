variable "assistant_sid" {
  description = "The SID of the Autopilot assistant"
  type        = string
}

variable "field_type_sid" {
  description = "The SID of the Autopilot field type"
  type        = string
}

variable "language_override" {
  description = "The language to be used instead of the default"
  type        = string
  default     = null
}

variable "default_language" {
  description = "The default language to use"
  type        = string
}

variable "value" {
  description = "The value of the field"
  type        = string
}

variable "synonyms" {
  description = "Synonym field values"
  type = list(object({
    language_override = string
    value             = string
  }))
  default = []
}
