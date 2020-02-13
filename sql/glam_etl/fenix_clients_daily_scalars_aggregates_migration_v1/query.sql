-- Query generated by: python3 -m bigquery_etl.glam.glean_scalar_aggregates --agg-type scalars --table-id org_mozilla_fenix_stable.migration_v1
WITH filtered AS (
  SELECT
    *,
    DATE(submission_timestamp) AS submission_date,
    client_info.client_id,
    REPLACE(ping_info.ping_type, "_", "-") AS ping_type,
    COALESCE(
      SAFE_CAST(SPLIT(client_info.app_display_version, '.')[OFFSET(0)] AS INT64),
      0
    ) AS app_version,
    client_info.os AS os,
    client_info.app_build AS app_build_id,
    client_info.app_channel AS channel
  FROM
    `moz-fx-data-shared-prod.org_mozilla_fenix_stable.migration_v1`
  WHERE
    DATE(submission_timestamp) = @submission_date
    AND client_info.app_channel IN ("release", "fenixProduction")
    AND client_info.client_id IS NOT NULL
),
aggregated AS (
  SELECT
    client_id,
    ping_type,
    submission_date,
    os,
    app_version,
    app_build_id,
    channel,
    ARRAY<STRUCT<metric STRING, metric_type STRING, key STRING, agg_type STRING, value FLOAT64>>[
      (
        'migration_addons_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_addons_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_addons_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_addons_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_addons_failed_addons',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_addons_failed_addons AS INT64))
      ),
      (
        'migration_addons_failed_addons',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_addons_failed_addons) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_addons_failed_addons',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_addons_failed_addons AS INT64))
      ),
      (
        'migration_addons_failed_addons',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_addons_failed_addons AS INT64))
      ),
      (
        'migration_addons_failed_addons',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_addons_failed_addons AS INT64))
      ),
      (
        'migration_addons_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_addons_failure_reason AS INT64))
      ),
      (
        'migration_addons_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_addons_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_addons_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_addons_failure_reason AS INT64))
      ),
      (
        'migration_addons_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_addons_failure_reason AS INT64))
      ),
      (
        'migration_addons_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_addons_failure_reason AS INT64))
      ),
      (
        'migration_addons_migrated_addons',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_addons_migrated_addons AS INT64))
      ),
      (
        'migration_addons_migrated_addons',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_addons_migrated_addons) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_addons_migrated_addons',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_addons_migrated_addons AS INT64))
      ),
      (
        'migration_addons_migrated_addons',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_addons_migrated_addons AS INT64))
      ),
      (
        'migration_addons_migrated_addons',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_addons_migrated_addons AS INT64))
      ),
      (
        'migration_addons_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_addons_success_reason AS INT64))
      ),
      (
        'migration_addons_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_addons_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_addons_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_addons_success_reason AS INT64))
      ),
      (
        'migration_addons_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_addons_success_reason AS INT64))
      ),
      (
        'migration_addons_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_addons_success_reason AS INT64))
      ),
      (
        'migration_bookmarks_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_bookmarks_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_bookmarks_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_bookmarks_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_bookmarks_detected',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_bookmarks_detected AS INT64))
      ),
      (
        'migration_bookmarks_detected',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_bookmarks_detected) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_bookmarks_detected',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_bookmarks_detected AS INT64))
      ),
      (
        'migration_bookmarks_detected',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_bookmarks_detected AS INT64))
      ),
      (
        'migration_bookmarks_detected',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_bookmarks_detected AS INT64))
      ),
      (
        'migration_bookmarks_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_bookmarks_failure_reason AS INT64))
      ),
      (
        'migration_bookmarks_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_bookmarks_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_bookmarks_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_bookmarks_failure_reason AS INT64))
      ),
      (
        'migration_bookmarks_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_bookmarks_failure_reason AS INT64))
      ),
      (
        'migration_bookmarks_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_bookmarks_failure_reason AS INT64))
      ),
      (
        'migration_bookmarks_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_bookmarks_success_reason AS INT64))
      ),
      (
        'migration_bookmarks_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_bookmarks_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_bookmarks_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_bookmarks_success_reason AS INT64))
      ),
      (
        'migration_bookmarks_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_bookmarks_success_reason AS INT64))
      ),
      (
        'migration_bookmarks_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_bookmarks_success_reason AS INT64))
      ),
      (
        'migration_fxa_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_fxa_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_fxa_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_fxa_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_fxa_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_fxa_failure_reason AS INT64))
      ),
      (
        'migration_fxa_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_fxa_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_fxa_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_fxa_failure_reason AS INT64))
      ),
      (
        'migration_fxa_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_fxa_failure_reason AS INT64))
      ),
      (
        'migration_fxa_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_fxa_failure_reason AS INT64))
      ),
      (
        'migration_fxa_has_custom_idp_server',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_fxa_has_custom_idp_server = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_fxa_has_custom_idp_server',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_fxa_has_custom_idp_server = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_fxa_has_custom_token_server',
        'boolean',
        '',
        'false',
        SUM(
          CASE
          WHEN
            metrics.boolean.migration_fxa_has_custom_token_server = FALSE
          THEN
            1
          ELSE
            0
          END
        )
      ),
      (
        'migration_fxa_has_custom_token_server',
        'boolean',
        '',
        'true',
        SUM(
          CASE
          WHEN
            metrics.boolean.migration_fxa_has_custom_token_server = TRUE
          THEN
            1
          ELSE
            0
          END
        )
      ),
      (
        'migration_fxa_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_fxa_success_reason AS INT64))
      ),
      (
        'migration_fxa_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_fxa_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_fxa_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_fxa_success_reason AS INT64))
      ),
      (
        'migration_fxa_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_fxa_success_reason AS INT64))
      ),
      (
        'migration_fxa_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_fxa_success_reason AS INT64))
      ),
      (
        'migration_gecko_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_gecko_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_gecko_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_gecko_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_gecko_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_gecko_failure_reason AS INT64))
      ),
      (
        'migration_gecko_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_gecko_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_gecko_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_gecko_failure_reason AS INT64))
      ),
      (
        'migration_gecko_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_gecko_failure_reason AS INT64))
      ),
      (
        'migration_gecko_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_gecko_failure_reason AS INT64))
      ),
      (
        'migration_gecko_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_gecko_success_reason AS INT64))
      ),
      (
        'migration_gecko_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_gecko_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_gecko_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_gecko_success_reason AS INT64))
      ),
      (
        'migration_gecko_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_gecko_success_reason AS INT64))
      ),
      (
        'migration_gecko_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_gecko_success_reason AS INT64))
      ),
      (
        'migration_history_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_history_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_history_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_history_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_history_detected',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_history_detected AS INT64))
      ),
      (
        'migration_history_detected',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_history_detected) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_history_detected',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_history_detected AS INT64))
      ),
      (
        'migration_history_detected',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_history_detected AS INT64))
      ),
      (
        'migration_history_detected',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_history_detected AS INT64))
      ),
      (
        'migration_history_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_history_failure_reason AS INT64))
      ),
      (
        'migration_history_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_history_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_history_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_history_failure_reason AS INT64))
      ),
      (
        'migration_history_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_history_failure_reason AS INT64))
      ),
      (
        'migration_history_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_history_failure_reason AS INT64))
      ),
      (
        'migration_history_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_history_success_reason AS INT64))
      ),
      (
        'migration_history_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_history_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_history_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_history_success_reason AS INT64))
      ),
      (
        'migration_history_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_history_success_reason AS INT64))
      ),
      (
        'migration_history_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_history_success_reason AS INT64))
      ),
      (
        'migration_logins_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_logins_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_logins_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_logins_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_logins_detected',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_logins_detected AS INT64))
      ),
      (
        'migration_logins_detected',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_logins_detected) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_logins_detected',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_logins_detected AS INT64))
      ),
      (
        'migration_logins_detected',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_logins_detected AS INT64))
      ),
      (
        'migration_logins_detected',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_logins_detected AS INT64))
      ),
      (
        'migration_logins_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_logins_failure_reason AS INT64))
      ),
      (
        'migration_logins_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_logins_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_logins_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_logins_failure_reason AS INT64))
      ),
      (
        'migration_logins_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_logins_failure_reason AS INT64))
      ),
      (
        'migration_logins_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_logins_failure_reason AS INT64))
      ),
      (
        'migration_logins_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_logins_success_reason AS INT64))
      ),
      (
        'migration_logins_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_logins_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_logins_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_logins_success_reason AS INT64))
      ),
      (
        'migration_logins_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_logins_success_reason AS INT64))
      ),
      (
        'migration_logins_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_logins_success_reason AS INT64))
      ),
      (
        'migration_logins_unsupported_db_version',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_logins_unsupported_db_version AS INT64))
      ),
      (
        'migration_logins_unsupported_db_version',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_logins_unsupported_db_version) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_logins_unsupported_db_version',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_logins_unsupported_db_version AS INT64))
      ),
      (
        'migration_logins_unsupported_db_version',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_logins_unsupported_db_version AS INT64))
      ),
      (
        'migration_logins_unsupported_db_version',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_logins_unsupported_db_version AS INT64))
      ),
      (
        'migration_open_tabs_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_open_tabs_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_open_tabs_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_open_tabs_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_open_tabs_detected',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_open_tabs_detected AS INT64))
      ),
      (
        'migration_open_tabs_detected',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_open_tabs_detected) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_open_tabs_detected',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_open_tabs_detected AS INT64))
      ),
      (
        'migration_open_tabs_detected',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_open_tabs_detected AS INT64))
      ),
      (
        'migration_open_tabs_detected',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_open_tabs_detected AS INT64))
      ),
      (
        'migration_open_tabs_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_open_tabs_failure_reason AS INT64))
      ),
      (
        'migration_open_tabs_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_open_tabs_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_open_tabs_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_open_tabs_failure_reason AS INT64))
      ),
      (
        'migration_open_tabs_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_open_tabs_failure_reason AS INT64))
      ),
      (
        'migration_open_tabs_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_open_tabs_failure_reason AS INT64))
      ),
      (
        'migration_open_tabs_migrated',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_open_tabs_migrated AS INT64))
      ),
      (
        'migration_open_tabs_migrated',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_open_tabs_migrated) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_open_tabs_migrated',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_open_tabs_migrated AS INT64))
      ),
      (
        'migration_open_tabs_migrated',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_open_tabs_migrated AS INT64))
      ),
      (
        'migration_open_tabs_migrated',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_open_tabs_migrated AS INT64))
      ),
      (
        'migration_open_tabs_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_open_tabs_success_reason AS INT64))
      ),
      (
        'migration_open_tabs_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_open_tabs_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_open_tabs_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_open_tabs_success_reason AS INT64))
      ),
      (
        'migration_open_tabs_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_open_tabs_success_reason AS INT64))
      ),
      (
        'migration_open_tabs_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_open_tabs_success_reason AS INT64))
      ),
      (
        'migration_pinned_sites_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_pinned_sites_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_pinned_sites_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_pinned_sites_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_pinned_sites_detected_pinned_sites',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_pinned_sites_detected_pinned_sites AS INT64))
      ),
      (
        'migration_pinned_sites_detected_pinned_sites',
        'counter',
        '',
        'count',
        IF(
          MIN(metrics.counter.migration_pinned_sites_detected_pinned_sites) IS NULL,
          NULL,
          COUNT(*)
        )
      ),
      (
        'migration_pinned_sites_detected_pinned_sites',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_pinned_sites_detected_pinned_sites AS INT64))
      ),
      (
        'migration_pinned_sites_detected_pinned_sites',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_pinned_sites_detected_pinned_sites AS INT64))
      ),
      (
        'migration_pinned_sites_detected_pinned_sites',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_pinned_sites_detected_pinned_sites AS INT64))
      ),
      (
        'migration_pinned_sites_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_pinned_sites_failure_reason AS INT64))
      ),
      (
        'migration_pinned_sites_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_pinned_sites_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_pinned_sites_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_pinned_sites_failure_reason AS INT64))
      ),
      (
        'migration_pinned_sites_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_pinned_sites_failure_reason AS INT64))
      ),
      (
        'migration_pinned_sites_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_pinned_sites_failure_reason AS INT64))
      ),
      (
        'migration_pinned_sites_migrated_pinned_sites',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_pinned_sites_migrated_pinned_sites AS INT64))
      ),
      (
        'migration_pinned_sites_migrated_pinned_sites',
        'counter',
        '',
        'count',
        IF(
          MIN(metrics.counter.migration_pinned_sites_migrated_pinned_sites) IS NULL,
          NULL,
          COUNT(*)
        )
      ),
      (
        'migration_pinned_sites_migrated_pinned_sites',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_pinned_sites_migrated_pinned_sites AS INT64))
      ),
      (
        'migration_pinned_sites_migrated_pinned_sites',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_pinned_sites_migrated_pinned_sites AS INT64))
      ),
      (
        'migration_pinned_sites_migrated_pinned_sites',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_pinned_sites_migrated_pinned_sites AS INT64))
      ),
      (
        'migration_pinned_sites_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_pinned_sites_success_reason AS INT64))
      ),
      (
        'migration_pinned_sites_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_pinned_sites_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_pinned_sites_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_pinned_sites_success_reason AS INT64))
      ),
      (
        'migration_pinned_sites_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_pinned_sites_success_reason AS INT64))
      ),
      (
        'migration_pinned_sites_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_pinned_sites_success_reason AS INT64))
      ),
      (
        'migration_search_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_search_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_search_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_search_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_search_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_search_failure_reason AS INT64))
      ),
      (
        'migration_search_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_search_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_search_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_search_failure_reason AS INT64))
      ),
      (
        'migration_search_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_search_failure_reason AS INT64))
      ),
      (
        'migration_search_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_search_failure_reason AS INT64))
      ),
      (
        'migration_search_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_search_success_reason AS INT64))
      ),
      (
        'migration_search_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_search_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_search_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_search_success_reason AS INT64))
      ),
      (
        'migration_search_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_search_success_reason AS INT64))
      ),
      (
        'migration_search_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_search_success_reason AS INT64))
      ),
      (
        'migration_settings_any_failures',
        'boolean',
        '',
        'false',
        SUM(CASE WHEN metrics.boolean.migration_settings_any_failures = FALSE THEN 1 ELSE 0 END)
      ),
      (
        'migration_settings_any_failures',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_settings_any_failures = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_settings_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_settings_failure_reason AS INT64))
      ),
      (
        'migration_settings_failure_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_settings_failure_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_settings_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_settings_failure_reason AS INT64))
      ),
      (
        'migration_settings_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_settings_failure_reason AS INT64))
      ),
      (
        'migration_settings_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_settings_failure_reason AS INT64))
      ),
      (
        'migration_settings_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_settings_success_reason AS INT64))
      ),
      (
        'migration_settings_success_reason',
        'counter',
        '',
        'count',
        IF(MIN(metrics.counter.migration_settings_success_reason) IS NULL, NULL, COUNT(*))
      ),
      (
        'migration_settings_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_settings_success_reason AS INT64))
      ),
      (
        'migration_settings_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_settings_success_reason AS INT64))
      ),
      (
        'migration_settings_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_settings_success_reason AS INT64))
      ),
      (
        'migration_settings_telemetry_enabled',
        'boolean',
        '',
        'false',
        SUM(
          CASE
          WHEN
            metrics.boolean.migration_settings_telemetry_enabled = FALSE
          THEN
            1
          ELSE
            0
          END
        )
      ),
      (
        'migration_settings_telemetry_enabled',
        'boolean',
        '',
        'true',
        SUM(CASE WHEN metrics.boolean.migration_settings_telemetry_enabled = TRUE THEN 1 ELSE 0 END)
      ),
      (
        'migration_telemetry_identifiers_any_failures',
        'boolean',
        '',
        'false',
        SUM(
          CASE
          WHEN
            metrics.boolean.migration_telemetry_identifiers_any_failures = FALSE
          THEN
            1
          ELSE
            0
          END
        )
      ),
      (
        'migration_telemetry_identifiers_any_failures',
        'boolean',
        '',
        'true',
        SUM(
          CASE
          WHEN
            metrics.boolean.migration_telemetry_identifiers_any_failures = TRUE
          THEN
            1
          ELSE
            0
          END
        )
      ),
      (
        'migration_telemetry_identifiers_failure_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_telemetry_identifiers_failure_reason AS INT64))
      ),
      (
        'migration_telemetry_identifiers_failure_reason',
        'counter',
        '',
        'count',
        IF(
          MIN(metrics.counter.migration_telemetry_identifiers_failure_reason) IS NULL,
          NULL,
          COUNT(*)
        )
      ),
      (
        'migration_telemetry_identifiers_failure_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_telemetry_identifiers_failure_reason AS INT64))
      ),
      (
        'migration_telemetry_identifiers_failure_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_telemetry_identifiers_failure_reason AS INT64))
      ),
      (
        'migration_telemetry_identifiers_failure_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_telemetry_identifiers_failure_reason AS INT64))
      ),
      (
        'migration_telemetry_identifiers_success_reason',
        'counter',
        '',
        'avg',
        avg(CAST(metrics.counter.migration_telemetry_identifiers_success_reason AS INT64))
      ),
      (
        'migration_telemetry_identifiers_success_reason',
        'counter',
        '',
        'count',
        IF(
          MIN(metrics.counter.migration_telemetry_identifiers_success_reason) IS NULL,
          NULL,
          COUNT(*)
        )
      ),
      (
        'migration_telemetry_identifiers_success_reason',
        'counter',
        '',
        'max',
        max(CAST(metrics.counter.migration_telemetry_identifiers_success_reason AS INT64))
      ),
      (
        'migration_telemetry_identifiers_success_reason',
        'counter',
        '',
        'min',
        min(CAST(metrics.counter.migration_telemetry_identifiers_success_reason AS INT64))
      ),
      (
        'migration_telemetry_identifiers_success_reason',
        'counter',
        '',
        'sum',
        sum(CAST(metrics.counter.migration_telemetry_identifiers_success_reason AS INT64))
      )
    ] AS scalar_aggregates
  FROM
    filtered
  GROUP BY
    client_id,
    ping_type,
    submission_date,
    os,
    app_version,
    app_build_id,
    channel
)
SELECT
  *
FROM
  aggregated
