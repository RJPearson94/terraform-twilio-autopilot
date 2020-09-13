variable "assistant_sid" {
  description = ""
  type        = string
}

variable "field_type_sid" {
  description = ""
  type        = string
}

variable "language_override" {
  description = ""
  type        = string
  default     = null
}

variable "default_language" {
  description = ""
  type        = string
}

variable "value" {
  description = ""
  type        = string
}

variable "synonyms" {
  description = ""
  type = list(object({
    language_override = string
    value             = string
  }))
  default = []
}
