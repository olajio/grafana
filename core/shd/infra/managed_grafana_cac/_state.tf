terraform {
  backend "s3" {
    bucket     = "hedgeserv-shd-lz-us-east-2-s3-tf-state"
    key        = "core/shd/infra/managed_grafana_cac/terraform.tfstate"
    kms_key_id = "alias/hedgeserv-shd-lz-us-east-2-s3-tf-state-kms-key"
    encrypt    = true
    region     = "us-east-2"
  }
}


data "terraform_remote_state" "managed_grafana" {
  backend = "s3"
  config = {
    bucket = "hedgeserv-shd-lz-us-east-2-s3-tf-state"
    key    = "core/shd/infra/managed_grafana/terraform.tfstate"
    region = "us-east-2"
  }
}


data "terraform_remote_state" "managed_prometheus_rnd" {
  backend = "s3"
  config = {
    bucket = "hedgeserv-rnd-avm-us-east-2-s3-tf-state"
    key    = "application/infra/prometheus/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "managed_prometheus_qa" {
  backend = "s3"
  config = {
    bucket = "hedgeserv-qa-avm-us-east-2-s3-tf-state"
    key    = "application/infra/prometheus/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "managed_prometheus_uat" {
  backend = "s3"
  config = {
    bucket = "hedgeserv-uat-avm-us-east-2-s3-tf-state"
    key    = "application/infra/prometheus/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "managed_prometheus_tst" {
  backend = "s3"
  config = {
    bucket = "hedgeserv-tst-avm-us-east-2-s3-tf-state"
    key    = "application/infra/prometheus/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "managed_prometheus_prd" {
  backend = "s3"
  config = {
    bucket = "hedgeserv-prd-avm-us-east-2-s3-tf-state"
    key    = "application/infra/prometheus/terraform.tfstate"
    region = "us-east-2"
  }
}