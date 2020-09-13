variable "assistant_sid" {
  description = "The SID of the Autopilot assistant"
  type        = string
}

variable "task_sid" {
  description = "The SID of the Autopilot task"
  type        = string
}

variable "name" {
  description = "The name of the Autopilot task field"
  type        = string
}

variable "default_language" {
  description = "The default language to use for the task fields"
  type        = string
}

variable "built_in_type" {
  description = "A built in field type"
  type        = string
}

variable "custom_type" {
  description = "A custom field type"
  type = object({
    name = string
    values = list(object({
      language_override = string
      value             = string

      synonyms = list(object({
        language_override = string
        value             = string
      }))
    }))
  })
  default = null
}
