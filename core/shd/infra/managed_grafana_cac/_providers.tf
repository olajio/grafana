terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 3.7.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "grafana" {
  url  = "https://${data.terraform_remote_state.managed_grafana.outputs.grafana_ws_endpoint}"
  auth = data.terraform_remote_state.managed_grafana.outputs.grafana_token
}

# provider "aws" {
#   alias  = "us_east_1"
#   region = "us-east-1"
#   assume_role {
#     role_arn = data.terraform_remote_state.managed_prometheus_rnd.outputs.iam_role_prometheus-grafana-shd-crossaccount
#   }
# }

# # Default provider for us-east-2 (where state bucket is)
# provider "aws" {
#   region = "us-east-2"
# }
