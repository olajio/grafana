# Managed Grafana

resource "aws_grafana_workspace" "eks_grafana" {
  account_access_type      = "CURRENT_ACCOUNT"
  authentication_providers = ["SAML"]
  data_sources             = ["PROMETHEUS", "CLOUDWATCH"]
  permission_type          = "SERVICE_MANAGED"
  role_arn                 = aws_iam_role.managed_grafana_role.arn

  configuration = jsonencode(
    {
      "plugins" = {
        "pluginAdminEnabled" = false
      },
      "unifiedAlerting" = {
        "enabled" = true
      }
    }
  )
}

resource "aws_iam_role" "managed_grafana_role" {
  name = "aws_managed_grafana"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "grafana.amazonaws.com"
        }
      },
    ]
  })
}

data "template_file" "managed_grafana_role_policy" {
  template = file("policies/grafana_2_prometheus.json")
}

resource "aws_iam_policy" "aws_managed_grafana_role_policy" {
  name        = "core-shd-aws-managed-grafana-policy"
  description = "Permissions that are required by managed grafana to connect to managed prometheus"
  policy      = data.template_file.managed_grafana_role_policy.rendered
}

resource "aws_iam_role_policy_attachment" "managed_grafana_role_attach_prometheus" {
  policy_arn = aws_iam_policy.aws_managed_grafana_role_policy.arn
  role       = aws_iam_role.managed_grafana_role.name
}

#7095427b-b7fd-4655-adb3-778b6ea11c88 -> ELK-ITSMA-710; 77dff3a0-9026-4cc2-8bbf-8a05ba3c59de -> ELK-ITMGT; 6da0e02e-e324-4ac2-b228-81efc0a6cb38 -> MT_Grafana_Editor
resource "aws_grafana_workspace_saml_configuration" "ws_eks_grafana" {
  admin_role_values  = ["7095427b-b7fd-4655-adb3-778b6ea11c88", "77dff3a0-9026-4cc2-8bbf-8a05ba3c59de"]
  idp_metadata_url   = "https://login.microsoftonline.com/39e63823-376a-43fc-9fdd-4a3932faab97/federationmetadata/2007-06/federationmetadata.xml?appid=a2719e1b-6288-4e1b-8058-e027232e0cb4"
  workspace_id       = aws_grafana_workspace.eks_grafana.id
  role_assertion     = "http://schemas.microsoft.com/ws/2008/06/identity/claims/groups"
  groups_assertion   = "http://schemas.microsoft.com/ws/2008/06/identity/claims/groups"
  editor_role_values = ["6da0e02e-e324-4ac2-b228-81efc0a6cb38"]
}

#----------------- Connect to Grafana -------------------
resource "aws_grafana_workspace_service_account" "automation" {
  name         = "tf-admin"
  grafana_role = "ADMIN"
  workspace_id = aws_grafana_workspace.eks_grafana.id
}

locals {
  expiration_days    = 29
  expiration_seconds = 60 * 60 * 24 * local.expiration_days
}

resource "time_rotating" "rotate" {
  rotation_days = local.expiration_days
}

resource "time_static" "rotate" {
  rfc3339 = time_rotating.rotate.rfc3339
}

resource "aws_grafana_workspace_service_account_token" "grafana_automation" {
  name               = "api-key-tf-admin"
  service_account_id = aws_grafana_workspace_service_account.automation.service_account_id
  seconds_to_live    = local.expiration_seconds
  workspace_id       = aws_grafana_workspace.eks_grafana.id

  lifecycle {
    replace_triggered_by = [
      time_static.rotate
    ]
  }
}