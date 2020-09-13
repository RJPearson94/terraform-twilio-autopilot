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

variable "callback" {
  description = "The callback webhook"
  type = object({
    url    = string
    events = list(string)
  })
  default = null
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
