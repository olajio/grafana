# Managed Grafana - Configuration


# Data Sources
#----------------PRD------------------------------------
resource "grafana_data_source" "k8s_prd_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
      {
          httpMethod         = "GET"
          oauthPassThru      = false
          sigV4AssumeRoleArn = "arn:aws:iam::444205886984:role/prometheus-grafana-shd-crossaccount"
          sigV4Auth          = true
          sigV4AuthType      = "ec2_iam_role"
          sigV4Region        = "us-east-1"
      }
  )
  name               = "K8s PRD us-east-1"
  type               = "prometheus"
  url                = "https://aps-workspaces.us-east-1.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_prd.outputs.prometheus_ws_id_virginia}"
}

resource "grafana_data_source" "k8s_prd_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      httpMethod         = "GET"
      oauthPassThru      = false
      sigV4AssumeRoleArn = "arn:aws:iam::444205886984:role/prometheus-grafana-shd-crossaccount"
      sigV4Auth          = true
      sigV4AuthType      = "ec2_iam_role"
      sigV4Region        = "us-east-2"
    }
  )
  name               = "K8s PRD us-east-2"
  type               = "prometheus"
  url                = "https://aps-workspaces.us-east-2.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_prd.outputs.prometheus_ws_id}"
}

#----------------TST------------------------------------
resource "grafana_data_source" "k8s_tst_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
      {
          httpMethod         = "GET"
          oauthPassThru      = false
          sigV4AssumeRoleArn = "arn:aws:iam::818366959089:role/prometheus-grafana-shd-crossaccount"
          sigV4Auth          = true
          sigV4AuthType      = "ec2_iam_role"
          sigV4Region        = "us-east-1"
      }
  )
  name               = "K8s TST us-east-1"
  type               = "prometheus"
  url                = "https://aps-workspaces.us-east-1.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_tst.outputs.prometheus_ws_id_virginia}"
}

resource "grafana_data_source" "k8s_tst_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      httpMethod         = "GET"
      oauthPassThru      = false
      sigV4AssumeRoleArn = "arn:aws:iam::818366959089:role/prometheus-grafana-shd-crossaccount"
      sigV4Auth          = true
      sigV4AuthType      = "ec2_iam_role"
      sigV4Region        = "us-east-2"
    }
  )
  name               = "K8s TST us-east-2"
  type               = "prometheus"
  url                = "https://aps-workspaces.us-east-2.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_tst.outputs.prometheus_ws_id}"
}
#----------------UAT------------------------------------
resource "grafana_data_source" "k8s_uat_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
      {
          httpMethod         = "GET"
          oauthPassThru      = false
          sigV4AssumeRoleArn = "arn:aws:iam::036973397917:role/prometheus-grafana-shd-crossaccount"
          sigV4Auth          = true
          sigV4AuthType      = "ec2_iam_role"
          sigV4Region        = "us-east-1"
      }
  )
  name               = "K8s UAT us-east-1"
  type               = "prometheus"
  url                = "https://aps-workspaces.us-east-1.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_uat.outputs.prometheus_ws_id_virginia}"
}

resource "grafana_data_source" "k8s_uat_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      httpMethod         = "GET"
      oauthPassThru      = false
      sigV4AssumeRoleArn = "arn:aws:iam::036973397917:role/prometheus-grafana-shd-crossaccount"
      sigV4Auth          = true
      sigV4AuthType      = "ec2_iam_role"
      sigV4Region        = "us-east-2"
    }
  )
  name               = "K8s UAT us-east-2"
  type               = "prometheus"
  url                = "https://aps-workspaces.us-east-2.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_uat.outputs.prometheus_ws_id}"
}

#----------------QA------------------------------------
resource "grafana_data_source" "k8s_qa_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
      {
          httpMethod         = "GET"
          oauthPassThru      = false
          sigV4AssumeRoleArn = "arn:aws:iam::213997214095:role/prometheus-grafana-shd-crossaccount"
          sigV4Auth          = true
          sigV4AuthType      = "ec2_iam_role"
          sigV4Region        = "us-east-1"
      }
  )
  name               = "K8s QA us-east-1"
  type               = "prometheus"
  uid                = "bdxh31ibnhgcga"
  url                = "https://aps-workspaces.us-east-1.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_qa.outputs.prometheus_ws_id_virginia}"
}

resource "grafana_data_source" "k8s_qa_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      httpMethod         = "GET"
      oauthPassThru      = false
      sigV4AssumeRoleArn = "arn:aws:iam::213997214095:role/prometheus-grafana-shd-crossaccount"
      sigV4Auth          = true
      sigV4AuthType      = "ec2_iam_role"
      sigV4Region        = "us-east-2"
    }
  )
  name               = "K8s QA us-east-2"
  type               = "prometheus"
  uid                = "edxh2kwpr0g00d"
  url                = "https://aps-workspaces.us-east-2.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_qa.outputs.prometheus_ws_id}"
}

#----------------RND------------------------------------
resource "grafana_data_source" "k8s_rnd_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
      {
          httpMethod         = "GET"
          oauthPassThru      = false
          sigV4AssumeRoleArn = data.terraform_remote_state.managed_prometheus_rnd.outputs.iam_role_prometheus-grafana-shd-crossaccount
#          sigV4AssumeRoleArn = "arn:aws:iam::605836930483:role/prometheus-grafana-shd-crossaccount"
          sigV4Auth          = true
          sigV4AuthType      = "ec2_iam_role"
          sigV4Region        = "us-east-1"
      }
  )
  name               = "K8s RND us-east-1"
  type               = "prometheus"
  uid                = "cdxgurnzamcqof"
  url                = "https://aps-workspaces.us-east-1.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_rnd.outputs.prometheus_ws_id_virginia}"
}

resource "grafana_data_source" "k8s_rnd_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = true
  json_data_encoded  = jsonencode(
    {
      httpMethod         = "GET"
      oauthPassThru      = false
      prometheusType     = "Prometheus"
      sigV4AssumeRoleArn = data.terraform_remote_state.managed_prometheus_rnd.outputs.iam_role_prometheus-grafana-shd-crossaccount
      sigV4Auth          = true
      sigV4AuthType      = "ec2_iam_role"
      sigV4Region        = "us-east-2"
    }
  )
  name               = "K8s RND us-east-2"
  type               = "prometheus"
  uid                = "adwyk2ys954owc"
  url                = "https://aps-workspaces.us-east-2.amazonaws.com/workspaces/${data.terraform_remote_state.managed_prometheus_rnd.outputs.prometheus_ws_id}"
}

#=====================CW===============================
#-----------------------PRD----------------------------
resource "grafana_data_source" "cw_prd_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = "arn:aws:iam::444205886984:role/prometheus-grafana-shd-crossaccount"
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-1"
    }
  )
  name               = "CW PRD us-east-1"
  type               = "cloudwatch"
}

resource "grafana_data_source" "cw_prd_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = "arn:aws:iam::444205886984:role/prometheus-grafana-shd-crossaccount"
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-2"
    }
  )
  name               = "CW PRD us-east-2"
  type               = "cloudwatch"
}

#-----------------------TST----------------------------
resource "grafana_data_source" "cw_tst_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = "arn:aws:iam::818366959089:role/prometheus-grafana-shd-crossaccount"
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-1"
    }
  )
  name               = "CW TST us-east-1"
  type               = "cloudwatch"
}

resource "grafana_data_source" "cw_tst_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = "arn:aws:iam::818366959089:role/prometheus-grafana-shd-crossaccount"
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-2"
    }
  )
  name               = "CW TST us-east-2"
  type               = "cloudwatch"
}

#-----------------------UAT----------------------------
resource "grafana_data_source" "cw_uat_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = "arn:aws:iam::036973397917:role/prometheus-grafana-shd-crossaccount"
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-1"
    }
  )
  name               = "CW UAT us-east-1"
  type               = "cloudwatch"
}

resource "grafana_data_source" "cw_uat_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = "arn:aws:iam::036973397917:role/prometheus-grafana-shd-crossaccount"
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-2"
    }
  )
  name               = "CW UAT us-east-2"
  type               = "cloudwatch"
}

#-----------------------QA----------------------------
resource "grafana_data_source" "cw_qa_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = "arn:aws:iam::213997214095:role/prometheus-grafana-shd-crossaccount"
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-1"
    }
  )
  name               = "CW QA us-east-1"
  type               = "cloudwatch"
  uid                = "bdxl140tr5ssgb"
}

resource "grafana_data_source" "cw_qa_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = "arn:aws:iam::213997214095:role/prometheus-grafana-shd-crossaccount"
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-2"
    }
  )
  name               = "CW QA us-east-2"
  type               = "cloudwatch"
  uid                = "bdxl0znlbim80b"
}

#-----------------------RND----------------------------
resource "grafana_data_source" "cw_rnd_us-east-1" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = data.terraform_remote_state.managed_prometheus_rnd.outputs.iam_role_prometheus-grafana-shd-crossaccount
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-1"
    }
  )
  name               = "CW RND us-east-1"
  type               = "cloudwatch"
  uid                = "ddxkxbpk6ultsa"
}

resource "grafana_data_source" "cw_rnd_us-east-2" {
  access_mode        = "proxy"
  basic_auth_enabled = false
  is_default         = false
  json_data_encoded  = jsonencode(
    {
      assumeRoleArn = data.terraform_remote_state.managed_prometheus_rnd.outputs.iam_role_prometheus-grafana-shd-crossaccount
      authType      = "ec2_iam_role"
      defaultRegion = "us-east-2"
    }
  )
  name               = "CW RND us-east-2"
  type               = "cloudwatch"
  uid                = "edxkx4xf34e80d"
}

# locals {

#   metadata_rnd_us_east_1 = yamlencode({
#     groups = [{
#       name     = "cluster_metadata"
#       interval = "1m"
#       rules = [
#         {
#           record = "cluster_metadata"
#           expr   = "vector(1)"
#           labels = {
#             key   = "account_id"
#             value = "605836930483"
#           }
#         },
#         {
#           record = "cluster_metadata"
#           expr   = "vector(1)"
#           labels = { key = "elastic_dataViewId", value = "65cc084c-ed59-4163-9a67-48d03ef1e314" }
#         },
#         {
#           record = "cluster_metadata"
#           expr   = "vector(1)"
#           labels = { key = "region", value = "us-east-1" }
#         }
#       ]
#     }]
#   })
# 
#  metadata_rnd_us_east_2 = yamlencode({
#     groups = [{
#       name     = "cluster_metadata"
#       interval = "1m"
#       rules = [
#         {
#           record = "cluster_metadata"
#           expr   = "vector(1)"
#           labels = {
#             key   = "account_id"
#             value = "605836930483"
#           }
#         },
#         {
#           record = "cluster_metadata"
#           expr   = "vector(1)"
#           labels = { key = "env", value = "rnd" }
#         },
#         {
#           record = "cluster_metadata"
#           expr   = "vector(1)"
#           labels = { key = "region", value = "us-east-2" }
#         }
#       ]
#     }]
#   })  
# 
# }

# resource "aws_prometheus_rule_group_namespace" "metadata_rnd_us-east-1" {
#   provider     = aws.us_east_1
#   name         = "cluster-metadata"
#   workspace_id = data.terraform_remote_state.managed_prometheus_rnd.outputs.prometheus_ws_id_virginia
#   data         = local.metadata_rnd_us_east_1
# }

# resource "aws_prometheus_rule_group_namespace" "metadata_rnd_us-east-2" {
#   name         = "cluster-metadata"
#   workspace_id = data.terraform_remote_state.managed_prometheus_rnd.outputs.prometheus_ws_id
#   data         = local.metadata_rnd_us_east_2
# }

#Creating Dashboard folders
resource "grafana_folder" "CloudWatch" {
  title      = "CloudWatch"
}

resource "grafana_folder" "K8s" {
  title      = "K8s"
}

resource "grafana_folder" "Prometheus" {
  title      = "Prometheus"
}

resource "grafana_folder" "On_prem" {
  title      = "On-prem"
}

resource "grafana_folder" "Nginx" {
  title     = "Nginx"
}


resource "grafana_dashboard" "CloudWatch" {
  for_each = toset(local.cloudwatch_dashboards_list)
  folder = grafana_folder.CloudWatch.id
  config_json = file(each.value)
  depends_on = [grafana_folder.CloudWatch]
}

resource "grafana_dashboard" "K8s" {
  for_each = toset(local.k8s_dashboards_list)
  folder = grafana_folder.K8s.id
  config_json = file(each.value)
  depends_on = [grafana_folder.K8s]
}

resource "grafana_dashboard" "Prometheus" {
  for_each = toset(local.prometheus_dashboards_list)
  folder = grafana_folder.Prometheus.id
  config_json = file(each.value)
  depends_on = [grafana_folder.Prometheus]
}

resource "grafana_dashboard" "On_prem" {
  for_each = toset(local.on_prem_list)
  folder = grafana_folder.On_prem.id
  config_json = file(each.value)
  depends_on = [grafana_folder.On_prem]
}

resource "grafana_dashboard" "Nginx" {
  for_each = toset(local.nginx_list)
  folder = grafana_folder.Nginx.id
  config_json = file(each.value)
  depends_on = [grafana_folder.Nginx]
}

# AD sync permissions
resource "grafana_team" "group" {
  for_each = var.ad_group_uid
    name  = each.key
}

resource "grafana_team_external_group" "external_group" {
  for_each = var.ad_group_uid
    groups  = [
      each.value,
    ]
    team_id = grafana_team.group[each.key].id
}
