terraform {
  backend "s3" {
    bucket     = "hedgeserv-shd-lz-us-east-2-s3-tf-state"
    key        = "core/shd/infra/image_factories/<FOLDER NAME OF THE IMAGE FACTORY>/terraform.tfstate"
    kms_key_id = "alias/hedgeserv-shd-lz-us-east-2-s3-tf-state-kms-key"
    encrypt    = true
    region     = "us-east-2"
  }
}

data "terraform_remote_state" "image_factory_base_build" {
  backend = "s3"
  config = {
    bucket = "hedgeserv-shd-lz-us-east-2-s3-tf-state"
    key    = "core/shd/infra/image_factories/infra_image_factory_base-build/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "lz_adfs_account_roles" {
  backend = "s3"
  config = {
    bucket = "hedgeserv-org-tf-us-east-2-s3-state"
    key    = "lz/ou/core/org/solutions/adfs_account_roles/terraform.tfstate"
    region = "us-east-2"
  }
}
