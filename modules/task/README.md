# terraform-twilio-autopilot field value module

This module creates a task with 0 or more task fields and 0 or more task samples

## Requirements

| Name      | Version         |
| --------- | --------------- |
| terraform | >= 0.13, < 0.14 |
| twilio    | >= 0.2.1        |

## Providers

| Name   | Version  |
| ------ | -------- |
| twilio | >= 0.2.1 |

## Inputs

| Name             | Description                                                 | Type                                                                                                                                                                                                                                                                                                                               | Default | Required |
| ---------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| actions          | JSON string of Autopilot actions                            | `string`                                                                                                                                                                                                                                                                                                                           | `null`  |    no    |
| actions_url      | URL to retrieve Autopilot actions JSON                      | `string`                                                                                                                                                                                                                                                                                                                           | `null`  |    no    |
| assistant_sid    | The SID of the Autopilot assistant                          | `string`                                                                                                                                                                                                                                                                                                                           | n/a     |   yes    |
| default_language | The default language to use for the task, sample and fields | `string`                                                                                                                                                                                                                                                                                                                           | n/a     |   yes    |
| fields           | The task fields                                             | <pre>list(object({<br> name = string<br> type = object({<br> built_in = string<br> custom = object({<br> name = string<br> values = list(object({<br> language_override = string<br> value = string<br><br> synonyms = list(object({<br> language_override = string<br> value = string<br> }))<br> }))<br> })<br> })<br> }))</pre> | `[]`    |    no    |
| name             | The unique name of the Autopilot task                       | `string`                                                                                                                                                                                                                                                                                                                           | n/a     |   yes    |
| samples          | The task samples                                            | <pre>list(object({<br> tagged_text = string<br> language_override = string<br> source_channel = string<br> }))</pre>                                                                                                                                                                                                               | `[]`    |    no    |

## Outputs

| Name         | Description                                                                |
| ------------ | -------------------------------------------------------------------------- |
| change_hash  | Computed hash which can be used to determine if the resources have changed |
| task         | The generated Autopilot task                                               |
| task_action  | The generated Autopilot task                                               |
| task_fields  | The generated task fields                                                  |
| task_samples | The generated Autopilot task samples                                       |
