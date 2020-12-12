# terraform-twilio-autopilot field value module

This module creates a field value and 0 or more synonym field values

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

| Name              | Description                                    | Type                                                                               | Default | Required |
| ----------------- | ---------------------------------------------- | ---------------------------------------------------------------------------------- | ------- | :------: |
| assistant_sid     | The SID of the Autopilot assistant             | `string`                                                                           | n/a     |   yes    |
| default_language  | The default language to use                    | `string`                                                                           | n/a     |   yes    |
| field_type_sid    | The SID of the Autopilot field type            | `string`                                                                           | n/a     |   yes    |
| language_override | The language to be used instead of the default | `string`                                                                           | `null`  |    no    |
| synonyms          | Synonym field values                           | <pre>list(object({<br> language_override = string<br> value = string<br> }))</pre> | `[]`    |    no    |
| value             | The value of the field                         | `string`                                                                           | n/a     |   yes    |

## Outputs

| Name        | Description                                                                |
| ----------- | -------------------------------------------------------------------------- |
| change_hash | Computed hash which can be used to determine if the resources have changed |
| field_value | The generated Autopilot field value                                        |
| synonyms    | The generated Autopilot synonym field values                               |
