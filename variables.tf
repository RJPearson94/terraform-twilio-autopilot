variable "assistant_name" {
  description = "The unique name of the Autopilot assistant"
  type        = string
}

variable "stylesheet" {
  description = "The stylesheet JSON of the Autopilot assistant"
  type        = string
  default     = null
}

variable "defaults" {
  description = "The defaults JSON of the Autopilot assistant"
  type        = string
  default     = null
}

variable "development_stage" {
  description = "Whether the assistant is in development stage"
  type        = bool
  default     = false
}

variable "enable_logging" {
  description = "Whether query logging is enabled"
  type        = bool
  default     = false
}

variable "default_language" {
  description = "The default language to use for the task, sample and fields"
  type        = string
}

variable "callback" {
  description = "The callback webhook"
  type = object({
    url    = string
    events = list(string)
  })
  default = null
}

variable "polling" {
  description = ""
  type = object({
    enabled      = bool
    max_attempts = number
    delay_in_ms  = number
  })
  default = {
    enabled      = true
    max_attempts = null
    delay_in_ms  = null
  }
}

variable "webhooks" {
  description = "The webhooks which will be triggered on specific events"
  type = list(object({
    name   = string
    url    = string
    method = string
    events = list(string)
  }))
  default = []
}

variable "tasks" {
  description = "The tasks of the Autopilot assistants"
  type = list(object({
    name = string
    actions = object({
      json = string
      url  = string
    })
    fields = list(object({
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
    samples = list(object({
      tagged_text       = string
      language_override = string
      source_channel    = string
    }))
  }))
}
