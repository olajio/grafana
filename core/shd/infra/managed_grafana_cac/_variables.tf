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



variable "ad_group_uid" {
  type = map(string)
  default = {
    ELK-Dev               = "dc73a9c1-7234-4f97-bea0-e0049780f10e"
    ELK-Dev-600           = "c69efd1c-2469-4423-987d-4feac269ba07"
    ELK-Dev-BO-661        = "961d615c-9f1a-442a-89cf-7d02615cc0b4"
    ELK-Dev-FE-619        = "e486d7ba-7c6a-4266-a299-bbac81e88340"
    ELK-Dev-FO-662        = "750aefa4-bf87-449a-9da1-8213430c990c"
    ELK-Dev-GLMDB-666     = "506b0afd-2065-44f0-96a5-dfff37f04c8a"
    ELK-Dev-HI-663        = "497e045e-30f2-4ff1-be95-9ce929f82326"
    ELK-Dev-MO-621        = "f7e922a0-47df-43cd-acca-c8d8653bc2cb"
    ELK-Dev-QA-680        = "62b1d228-a3c1-477b-a803-d0cc03af2ada"
    ELK-Dev-Reporting-664 = "b97c6bfe-96ec-44fe-b42f-d0c4137ab26d"
    ELK-TechOps-798       = "404fc52f-105a-47d7-b593-3d42b07ed154"
    ELK-ServDesk-750-Role = "7f410285-a11d-4aaf-b1c6-94c093085d2d"
  }
}