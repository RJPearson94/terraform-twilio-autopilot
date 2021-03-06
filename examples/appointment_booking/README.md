# Appointment booking Autopilot bot

This example creates an appointment booking Autopilot bot.
The tasks, samples, stylesheet and defaults are copied from the `Appointment Scheduling` pre-trained template that Twilio supply in the console.

To improve the readability of the example the tasks JSON can be found in the task folder. The [javascript provider](https://registry.terraform.io/providers/apparentlymart/javascript/latest) is used to translate the task JSON and set any necessary defaults that are required by the Terraform module.

To prevent name clashes a random 16 character string is appended to the end of the assistant name

## Requirements

| Name       | Version  |
| ---------- | -------- |
| terraform  | >= 0.13  |
| javascript | >= 0.0.1 |
| twilio     | >= 0.2.0 |

## Providers

| Name       | Version  |
| ---------- | -------- |
| javascript | >= 0.0.1 |
| random     | n/a      |

## Modules

| Name                | Source | Version |
| ------------------- | ------ | ------- |
| appointment_booking | ../../ |         |

## Resources

| Name                                                                                                                          |
| ----------------------------------------------------------------------------------------------------------------------------- |
| [javascript_javascript](https://registry.terraform.io/providers/apparentlymart/javascript/0.0.1/docs/data-sources/javascript) |
| [random_string](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                        |

## Inputs

No input.

## Outputs

| Name          | Description                        |
| ------------- | ---------------------------------- |
| assistant_sid | The SID of the Autopilot assistant |
