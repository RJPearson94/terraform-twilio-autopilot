resource "random_string" "random" {
  length  = 16
  special = false
}

module "appointment_booking" {
  source = "../../"

  assistant_name   = "appointment-booking-${random_string.random.result}"
  defaults         = file("${path.module}/defaults.json")
  stylesheet       = file("${path.module}/stylesheet.json")
  default_language = "en-US"

  tasks = data.javascript.task_mapper.result
}