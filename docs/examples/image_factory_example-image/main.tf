module "factory" {
    source = "../../../../../modules/image_factory/v2.3"

    git_repo_name  = var.git_repo_name
    git_repo_owner = var.git_repo_owner

    ecr_repo_suffixes = var.ecr_repo_suffixes

    # uncomment the line below if the codebuild should not have a vpc config
    # enable_vpc = false

    cb_cache = {
        type  = "NO_CACHE"
        modes = []
    }

    cb_credentials_type = "SERVICE_ROLE"
    cb_runtime_image = "${data.terraform_remote_state.image_factory_base_build.outputs.image_factory.infra_image_ecr_url}:${var.runtime_image_version}"
    more_tags = {
        APPLICATION_NAME = var.git_repo_name
        abac_operator = "${data.terraform_remote_state.lz_adfs_account_roles.outputs.abac_codes.dev} ${data.terraform_remote_state.lz_adfs_account_roles.outputs.abac_codes.are}"
    }

    appcode = var.appcode

    providers = {
        aws   = aws
        aws.dr = aws.dr
    }
}
