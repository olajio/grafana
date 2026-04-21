variable "git_repo_owner" {
  description = "GIT repo owner"
  type        = string
}

variable "git_repo_name" {
  description = "GIT repo name"
  type        = string
}

variable "runtime_image_version" {}

variable "ecr_repo_suffixes" {
  description = ""
  type        = list(string)
}

variable "appcode" {
  description = "application code"
  type        = string
}
