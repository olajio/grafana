// Used by aws_managed_collector.tf will be moved to module if successful POC
locals {
  cloudwatch_dashboards_list        = fileset(path.module, "dashboards/cloudwatch/*.json")
  k8s_dashboards_list               = fileset(path.module, "dashboards/k8s/*.json")
  prometheus_dashboards_list        = fileset(path.module, "dashboards/prometheus/*.json")
  on_prem_list                      = fileset(path.module, "dashboards/on-prem/*.json")
  nginx_list                        = fileset(path.module, "dashboards/nginx/*.json")
}