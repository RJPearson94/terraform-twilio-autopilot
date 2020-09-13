variable "assistant_sid" {
  description = "The SID of the Autopilot assistant"
  type        = string
}

variable "default_language" {
  description = "The default language to use for the task, sample and fields"
  type        = string
}

variable "name" {
  description = "The unique name of the Autopilot task"
  type        = string
}

variable "actions" {
  description = "JSON string of Autopilot actions"
  type        = string
  default     = null
}

variable "actions_url" {
  description = "URL to retrieve Autopilot actions JSON"
  type        = string
  default     = null
}

variable "fields" {
  description = "The task fields"
  type = list(object({
    name = string
    type = object({
      built_in = string
      custom = object({
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
    })
  }))
  default = []
}

variable "samples" {
  description = "The task samples"
  type = list(object({
    tagged_text       = string
    language_override = string
    source_channel    = string
  }))
  default = []
}
