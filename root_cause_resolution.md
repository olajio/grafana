Here's a Jira-ready summary you can paste into your ticket, with clear placeholders for where each screenshot goes.

---

## Summary

The `deploy-cp-managed_grafana-infra-cac` pipeline was failing during the Terraform plan stage with `401 Expired API key` errors across all Grafana resources (21 data sources, 5 folders, 12 teams). Root cause was an expired Amazon Managed Grafana service account token (`api-key-tf-admin`) on the `tf-admin` service account in the shared Grafana workspace.

## Root Cause

The Grafana provider in `core/shd/infra/managed_grafana_cac/_providers.tf` authenticates using a token sourced via remote state from the `managed_grafana` stack. That token is defined as `aws_grafana_workspace_service_account_token.grafana_automation` in `core/shd/infra/managed_grafana/managed_grafana.tf` with a 29-day TTL and a `replace_triggered_by` lifecycle tied to `time_static.rotate`.

The rotation only fires when the `managed_grafana` pipeline executes. Since that pipeline had not run within the 29-day window, the token expired server-side in AMG, breaking every downstream read in the `managed_grafana_cac` plan.

## Resolution

1. Triggered `deploy-cp-managed_grafana-infra` to force token replacement. Terraform destroyed and recreated `aws_grafana_workspace_service_account_token.grafana_automation`, writing the fresh token value to the `managed_grafana` remote state output.
2. Triggered `deploy-cp-managed_grafana-infra-cac`. The Grafana provider picked up the new token via `data.terraform_remote_state.managed_grafana.outputs.grafana_token` and all 38 previously-failing resources refreshed and planned cleanly.
3. Approved and applied both pipelines. No drift detected.

## Verification

**`deploy-cp-managed_grafana-infra` pipeline — successful run**
*[Insert screenshot here: pipeline view showing all stages green — getSources → Plan → approval → Apply]*

**`deploy-cp-managed_grafana-infra-cac` pipeline — successful run**
*[Insert screenshot here: pipeline view showing all stages green, confirming the 401 errors are resolved]*

**Optional supporting evidence (include if you captured them):**
- *[CodeBuild log snippet showing `aws_grafana_workspace_service_account_token.grafana_automation` being replaced in the `managed_grafana-infra-apply` job]*
- *[CodeBuild log snippet from `managed_grafana-infra-cac-plan` showing `Plan: X to add, Y to change, Z to destroy` with no auth errors]*

## Follow-Up / Preventive Action

To prevent recurrence, I'm recommending one of the following (track as a separate ticket if needed):

- Schedule `deploy-cp-managed_grafana-infra` to auto-execute via EventBridge every ~25 days so `time_rotating.rotate` reliably ticks before the 29-day TTL expires.
- Alternative: emit a CloudWatch alarm off the `grafana_token_expires_at` output when T-3 days remaining, routed to the team alerting channel.

---

### Where to attach the screenshots in Jira

You have two good options depending on your team's convention:

**Inline (recommended for readability)** — in the Jira description editor, place your cursor where the `*[Insert screenshot here: ...]*` placeholder is, delete the placeholder line, and paste the image directly (Ctrl+V / Cmd+V). Jira will embed it inline at that spot.

**Attachments section** — drag the screenshots into the "Attachments" panel of the ticket and replace each placeholder with a reference like `[^grafana-infra-pipeline-success.png]`. This keeps the description lean and groups the evidence in one place, which is handy if auditors pull this ticket later for FedRAMP/FISMA evidence.

Name the files something searchable — e.g. `grafana-infra-pipeline-success.png` and `grafana-infra-cac-pipeline-success.png` — so they're easy to find in the attachments list.
