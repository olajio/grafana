No problem — here's a concise, self-contained Jira description you can drop in as-is. It's intentionally broad so it covers the likely scenarios without overcommitting to a root cause before investigation.

---

**Summary:** Access Denied errors on deployed Kibana Alert Rules

**Description:**

Intermittent and/or persistent "Access Denied" errors are being observed on Kibana Alert Rules deployed as part of the Watcher-to-Kibana alert migration. The errors are impacting rule execution and/or user access to manage the rules, resulting in missed alert coverage.

**Observed Behavior:**
- Deployed alert rules surface "Access Denied" / 403 errors during execution, in the Kibana UI, or when alert actions attempt to fire.
- Affected rules include those migrated from multi-tenant watchers (e.g., `sdpmt_52009`) using ES|QL queries with lookup indices such as `kibana_sdpmt_amdb`.
- Behavior appears across deployed environments; scope (specific deployments vs. all) to be confirmed during triage.

**Expected Behavior:**
- Alert rules execute on schedule against their ES|QL source and lookup indices without authorization errors.
- Authorized users can view, edit, and manage the rules within their assigned Kibana space.
- Alert actions (email / webhook) deliver successfully.

**Suspected Root Causes (to validate):**
- Insufficient index privileges on the rule's API key / service account for ES|QL source and lookup indices.
- Missing Kibana feature privileges (e.g., `feature_stackAlerts`, `feature_observability`) on the associated role for the target space.
- Role-to-space mapping gaps introduced during migration rollout.

**Impact:**
Alert coverage gap — conditions previously monitored by Watchers are no longer firing reliably through the migrated Kibana alert rules, affecting observability for federal-client dashboards.

**Acceptance Criteria:**
- Root cause of the Access Denied errors identified and documented.
- Affected rules executing successfully across all deployments.
- Role / privilege configuration corrected and validated.
- Preventive check added (e.g., post-deployment privilege validation) to avoid recurrence.

---

If you want, I can also spin this into a shorter 3–4 sentence version for the Jira summary field, or split it into a bug ticket + follow-up task.
