# terraform-twilio-autopilot

This is a terraform module for managing an autopilot assistant.

!> This module will destroy the model build before creating a new one

This module uses the Community Twilio Terraform Provider (also maintained by the module [author](https://github.com/RJPearson94))

- [Terraform Registry](https://registry.terraform.io/providers/RJPearson94/twilio/latest)
- [Github](https://github.com/RJPearson94/terraform-provider-twilio)

The following resources can be managed via the module:

- [Assistant](https://registry.terraform.io/providers/RJPearson94/twilio/latest/docs/resources/autopilot_assistant)
- [Field Type](https://registry.terraform.io/providers/RJPearson94/twilio/latest/docs/resources/autopilot_field_type)
- [Field Value](https://registry.terraform.io/providers/RJPearson94/twilio/latest/docs/resources/autopilot_field_value)
- [Model Build](https://registry.terraform.io/providers/RJPearson94/twilio/latest/docs/resources/autopilot_model_build)
- [Tasks](https://registry.terraform.io/providers/RJPearson94/twilio/latest/docs/resources/autopilot_task)
- [Task Fields](https://registry.terraform.io/providers/RJPearson94/twilio/latest/docs/resources/autopilot_task_field)
- [Task Samples](https://registry.terraform.io/providers/RJPearson94/twilio/latest/docs/resources/autopilot_task_sample)
- [Webhooks](https://registry.terraform.io/providers/RJPearson94/twilio/latest/docs/resources/autopilot_webhook)

!> **Disclaimer**: This project is not an official Twilio project and is not supported or endorsed by Twilio in any way. It is maintained in [my](https://github.com/RJPearson94) free time.

**NOTE:** The default branch for this project is called `main`

## Examples

Examples of how the Terraform module can be used can be found [here](./examples)

## Requirements

| Name      | Version         |
| --------- | --------------- |
| terraform | >= 0.13, < 0.14 |
| twilio    | >= 0.2.0        |

## Providers

| Name   | Version  |
| ------ | -------- |
| twilio | >= 0.2.0 |

## Inputs

| Name              | Description                                                 | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Default                                                                                  | Required |
| ----------------- | ----------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | :------: |
| assistant_name    | The unique name of the Autopilot assistant                  | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | n/a                                                                                      |   yes    |
| callback          | The callback webhook                                        | <pre>object({<br> url = string<br> events = list(string)<br> })</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | `null`                                                                                   |    no    |
| default_language  | The default language to use for the task, sample and fields | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | n/a                                                                                      |   yes    |
| defaults          | The defaults JSON of the Autopilot assistant                | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | `null`                                                                                   |    no    |
| development_stage | Whether the assistant is in development stage               | `bool`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | `false`                                                                                  |    no    |
| enable_logging    | Whether query logging is enabled                            | `bool`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | `false`                                                                                  |    no    |
| polling           | n/a                                                         | <pre>object({<br> enabled = bool<br> max_attempts = number<br> delay_in_ms = number<br> })</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | <pre>{<br> "delay_in_ms": null,<br> "enabled": true,<br> "max_attempts": null<br>}</pre> |    no    |
| stylesheet        | The stylesheet JSON of the Autopilot assistant              | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | `null`                                                                                   |    no    |
| tasks             | The tasks of the Autopilot assistants                       | <pre>list(object({<br> name = string<br> actions = object({<br> json = string<br> url = string<br> })<br> fields = list(object({<br> name = string<br> type = object({<br> built_in = string<br> custom = object({<br> name = string<br> values = list(object({<br> language_override = string<br> value = string<br><br> synonyms = list(object({<br> language_override = string<br> value = string<br> }))<br> }))<br> })<br> })<br> }))<br> samples = list(object({<br> tagged_text = string<br> language_override = string<br> source_channel = string<br> }))<br> }))</pre> | n/a                                                                                      |   yes    |
| webhooks          | The webhooks which will be triggered on specific events     | <pre>list(object({<br> name = string<br> url = string<br> method = string<br> events = list(string)<br> }))</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                | `[]`                                                                                     |    no    |

## Outputs

| Name        | Description                         |
| ----------- | ----------------------------------- |
| assistant   | The generated Autopilot assistant   |
| model_build | The generated Autopilot model build |
| tasks       | The generated tasks                 |
| webhooks    | The generated Autopilot webhooks    |

## Modules

This module utilises additional sub-modules which can be seen [here](./modules)
