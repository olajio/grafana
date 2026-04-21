output "grafana_iam_role_arn" {
  value = aws_iam_role.managed_grafana_role.arn
}

output "grafana_token" {
  value = aws_grafana_workspace_service_account_token.grafana_automation.key
  sensitive = true
}

output "grafana_token_expires_at" {
  value = aws_grafana_workspace_service_account_token.grafana_automation.expires_at
  sensitive = false
}

output "grafana_ws_endpoint" {
  value = aws_grafana_workspace.eks_grafana.endpoint
  sensitive = false
}

