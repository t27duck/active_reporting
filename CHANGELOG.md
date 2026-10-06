## 0.7.0 (Unreleased)

### Breaking Changes

- Only support supported versions of Ruby and Rails.
- Require ActiveRecord and ActiveSupport 8.0 or newer (previously any version was allowed)
- `Configuration.metric_lookup_class=` no longer singularizes the given name. `metric_lookup_class = StoredMetrics` now resolves to `::StoredMetrics` (previously `::StoredMetric`). If you relied on the old behavior (e.g. `metric_lookup_class = :metrics` to mean `::Metric`), pass the singular name instead.
- Removed the `{ created_at: :month }` shorthand for datetime drills on degenerate dimensions, deprecated in 0.6.0. Use `{ created_at: { datetime_drill: :month } }` instead; the old form now raises `InvalidDimensionLabel` with the replacement syntax. This also removes the spurious deprecation warning that was printed for every plain degenerate dimension (e.g. `dimensions: [:kind]`)
- Ransack is no longer required when the gem is loaded; it is loaded the first time a ransack feature is used
- Fact models generated for models without a `[ModelName]FactModel` class are no longer assigned to a constant (previously `PostFactModel` was defined the first time `Post.fact_model` was called). Define the fact model class if you need to reference it
- On MySQL, `datetime_drill` now truncates datetimes like PostgreSQL's `date_trunc` and returns `DATETIME` values, instead of extracting a part as an integer. For example, a `month` drill now returns `2026-09-01 00:00:00` instead of `9`, so the same month in different years is no longer grouped together. `week` now returns the Monday the week starts on (previously the day of the week) and `day` returns the date at midnight (previously the day of the month)

### Bug Fixes

- Fix `datetime_drill: :date` generating invalid SQL on PostgreSQL by quoting the column as a string literal
- `ActiveReporting.fetch_metric` now raises `BadMetricLookupClass` instead of `NameError` when the configured `metric_lookup_class` is not defined
- Dimension label callbacks are now applied when the dimension uses a custom `name:`, uses the default `:name` label, or is a degenerate dimension (previously they were silently skipped in all of these cases)
- Auto-generated fact models for namespaced models (e.g. `Admin::Post`) are now created in the model's namespace (`Admin::PostFactModel`) instead of raising `NameError`
- A `NameError` raised while loading a defined fact model is no longer swallowed and replaced with an empty auto-generated fact model
- Metric names are now quoted in the generated SQL, so metrics named after reserved words (e.g. `:order`) no longer produce invalid queries
- An invalid `order_by_dimension` direction now raises `ActiveReporting::InvalidOrderDirection` (a `RuntimeError` subclass, so existing `rescue RuntimeError` code still works) with a message naming the dimension
- Using a ransack dimension filter without ransack installed now raises `RansackNotAvailable` instead of `NoMethodError`
- `Configuration.ransack_fallback = false` no longer raises `RansackNotAvailable` when ransack is not installed
- Fact models are looked up again after Rails reloads code. Previously a generated fact model kept pointing to the model class from before the reload, and a model that isn't reloaded (e.g. from an engine) kept returning the old fact model

### Features

- `datetime_drill` now works on SQLite. All databases now truncate datetimes the same way PostgreSQL's `date_trunc` does
- `datetime_drill` now works with the Trilogy MySQL adapter (and any other adapter built on Rails' MySQL, PostgreSQL, or SQLite adapters)

### Misc

- `Dimension#hierarchical?` and `Dimension#association` now cache `false`/`nil` results instead of recomputing them on every call
- Add gem metadata (changelog, source, and bug tracker links) and require MFA for releases
- Requiring the gem no longer forces `ActiveRecord::Base` to load; models are extended via `ActiveSupport.on_load(:active_record)`
- Report queries now run through `select_all`, so they use the ActiveRecord query cache and appear as `ActiveReporting` in SQL logs and instrumentation
- Datetime drill SQL moved to `ActiveReporting::DatetimeDrill`; `ReportingDimension::SUPPORTED_DBS` was removed
- Fix typos and inaccurate descriptions in documentation comments, error messages, and the README
- `Configuration` uses `mattr_reader` with defaults instead of hand-written getters
- Development: `bin/setup` installs the adapter for `DB` and creates the test database, database adapters are optional Gemfile groups, and CI runs RuboCop (now including the tests) and codespell

## 0.6.2 (2024-03-18)

### Features

- `Metric` can now take an optional `measure` argument to override the measure that would normally be used.

## 0.6.1 (2020-08-29)

### Misc

- Add `date` as an option for datetime drills - _germanotm_

## 0.6.0 (2020-08-21)

### Features

- Support to implicit hierarchical on datetime columns in MySQL (#33) - _germanotm_
- Added `{ datetime_drill: :month }` option for reporting dimensions to explicitly - _germanotm_

  This deprecates the use of key-value only use for report dimension options (ie, `dimensions: [{ dim: single_option }]`).
  Instead, use `dimensions: [{ dim: { option: value} }]` See the README for all reporting dimension options.

## 0.5.1 (2020-06-31)

### Features

- Allow dimensions defined in a `Metric` to use LEFT OUTER JOINs via a new `:join_method` option (#32) - _germanotm_

### Misc

- Fixed warning about initialized variables
- Fixed Ruby 2.7 warning

## 0.5.0 (2020-06-30)

### Bug Fixes

- Fix Missing quotation marks in column names causing SQL errors on MYSQL (#30) - _germanotm_

### Misc

- Update matrix to only supported Rubies and Rails versions. Rails 5.2+ and Ruby 2.5+ are officially supported now.

## 0.4.2 (2019-11-01)

### Misc

- Test against Rails 6.0 final
- Fixed deprecated call to `to_hash` - _joshforbes_
- Corrected readme entry for `dimensions` option for `ActiveReporting::Metric` - _joshforbes_

## 0.4.1 (2019-05-28)

### Features

- Hierarchical dimensions may now have custom keys in result (#16) - _andresgutgon_

### Misc

- Test against Raisl 6.0RC
- Loosen AR requirements. The gem will install for any AR version, but only ones listed in the README are supported
- Test against active Rubies

## 0.4.0 (2018-05-02)

### Breaking Changes

- Gemspec now requires Ruby 2.3 and later to install

### Features

- Dimension off of `datetime` columns by date parts in PostgreSQL (See README for details) (#10) - _niborg_

## 0.3.0 (2018-04-12)

### Bug Fixes

- Specify rescue from LoadError for ransack (#9) - _niborg_
- Fix ransack fallback logic (#8) - _germanotm_

### Misc

- Test against Rails 5.2
- Test against Ruby 2.5
- Drop support for Rails 5.0 (EOL-ed)
- Drop support for Ruby 2.2 (EOL-ed)

## 0.2.0 (2017-06-17)

### Breaking Changes

- `FactModel.use_model` renamed to `FactModel.model=`

### Bug Fixes

- `metric` lives on fact model and not metric (#3) - _wheeyls_

### Misc

- Readme corrections and updates (#2) - _wheeyls_

## 0.1.1 (2017-04-22)

### Bug Fixes

- Fix MySQL querying

### Misc

- Properly test against multiple dbs and versions of ActiveRecord in CI

## 0.1.0 (2017-04-16)

- Initial release
