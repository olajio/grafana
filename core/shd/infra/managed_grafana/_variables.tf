variable "region" {
  description = "AWS region. Default is to take it with tf data."
  type        = string
  default     = "us-east-2"
}

variable "region_dr" {
  description = "AWS region. Default is to take it with tf data."
  type        = string
  default     = "us-east-1"
}