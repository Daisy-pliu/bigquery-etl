CREATE OR REPLACE VIEW
  `moz-fx-data-shared-prod.telemetry.active_profiles`
AS SELECT * FROM
  `moz-fx-data-derived-datasets.telemetry_derived.active_profiles_v1`
