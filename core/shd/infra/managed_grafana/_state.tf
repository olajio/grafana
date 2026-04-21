terraform {
  backend "s3" {
    bucket     = "hedgeserv-shd-lz-us-east-2-s3-tf-state"
    key        = "core/shd/infra/managed_grafana/terraform.tfstate"
    kms_key_id = "alias/hedgeserv-shd-lz-us-east-2-s3-tf-state-kms-key"
    encrypt    = true
    region     = "us-east-2"
  }
}
