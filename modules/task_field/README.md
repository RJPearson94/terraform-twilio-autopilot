# terraform-twilio-autopilot task field module

This module creates a task field and optionally creates a field type and field values when a custom field type is specified

## Requirements

| Name      | Version  |
| --------- | ---------|
| terraform | >= 0.13  |
| twilio    | >= 0.1.0 |

## Providers

| Name   | Version  |
| ------ | -------- |
| twilio | >= 0.1.0 |

## Inputs

| Name             | Description                                     | Type                                                                                                                                                                                                                         | Default | Required |
| ---------------- | ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| assistant_sid    | The SID of the Autopilot assistant              | `string`                                                                                                                                                                                                                     | n/a     |   yes    |
| built_in\type    | A built in field type                           | `string`                                                                                                                                                                                                                     | n/a     |   yes    |
| custom_type      | A custom field type                             | <pre>object({<br> name = string<br> values = list(object({<br> language_override = string<br> value = string<br><br> synonyms = list(object({<br> language_override = string<br> value = string<br> }))<br> }))<br> })</pre> | `null`  |    no    |
| default_language | The default language to use for the task fields | `string`                                                                                                                                                                                                                     | n/a     |   yes    |
| name             | The name of the Autopilot task field            | `string`                                                                                                                                                                                                                     | n/a     |   yes    |
| task_sid         | The SID of the Autopilot task                   | `string`                                                                                                                                                                                                                     | n/a     |   yes    |

## Outputs

| Name         | Description                                                                |
| ------------ | -------------------------------------------------------------------------- |
| change_hash  | Computed hash which can be used to determine if the resources have changed |
| field_type   | The generated Autopilot field type                                         |
| field_values | The generated field values                                                 |
