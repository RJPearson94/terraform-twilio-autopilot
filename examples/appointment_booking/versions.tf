terraform {
  required_version = ">= 0.13"

  required_providers {
    javascript = {
      source  = "apparentlymart/javascript"
      version = ">= 0.0.1"
    }
    twilio = {
      source  = "RJPearson94/twilio"
      version = ">= 0.2.0"
    }
  }
}