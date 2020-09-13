# terraform-twilio-autopilot assistant module

This module creates an assistant and 0 or more webhooks

## Requirements

| Name      | Version         |
| --------- | --------------- |
| terraform | >= 0.13, < 0.14 |
| twilio    | >= 0.1.0        |

## Providers

| Name   | Version  |
| ------ | -------- |
| twilio | >= 0.1.0 |

## Inputs

| Name              | Description                                             | Type                                                                                                              | Default | Required |
| ----------------- | ------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| assistant_name    | The unique name of the Autopilot assistant              | `string`                                                                                                          | n/a     |   yes    |
| callback          | The callback webhook                                    | <pre>object({<br> url = string<br> events = list(string)<br> })</pre>                                             | `null`  |    no    |
| defaults          | The defaults JSON of the Autopilot assistant            | `string`                                                                                                          | `null`  |    no    |
| development_stage | Whether the assistant is in development stage           | `bool`                                                                                                            | `false` |    no    |
| enable_logging    | Whether query logging is enabled                        | `bool`                                                                                                            | `false` |    no    |
| stylesheet        | The stylesheet JSON of the Autopilot assistant          | `string`                                                                                                          | `null`  |    no    |
| webhooks          | The webhooks which will be triggered on specific events | <pre>list(object({<br> name = string<br> url = string<br> method = string<br> events = list(string)<br> }))</pre> | `[]`    |    no    |

## Outputs

| Name      | Description                                |
| --------- | ------------------------------------------ |
| assistant | The generated Autopilot assistant          |
| webhooks  | The generated Autopilot assistant webhooks |
