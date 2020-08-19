## Unreleased (unreleased)

### Features

* Support to implicit hierarchical on datetime columns in MySQL (#33) - *germanotm*

## 0.5.1 (2020-06-31)

### Features

* Allow dimensions defined in a `Metric` to use LEFT OUTER JOINs via a new `:join_method` option (#32) - *germanotm*

### Misc

* Fixed warning about initialized variables
* Fixed Ruby 2.7 warning

## 0.5.0 (2020-06-30)

### Bug Fixes

* Fix Missing quotation marks in column names causing SQL errors on MYSQL (#30) - *germanotm*

### Misc

* Update matrix to only supported Rubies and Rails versions. Rails 5.2+ and Ruby 2.5+ are officially supported now.

## 0.4.2 (2019-11-01)

### Misc

* Test against Rails 6.0 final
* Fixed deprecated call to `to_hash` - *joshforbes*
* Corrected readme entry for `dimesions` option for `ActiveReporting::Metric` - *joshforbes*

## 0.4.1 (2019-05-28)

### Features

* Hierarchical dimensions may now have custom keys in result (#16) - *andresgutgon*

### Misc

* Test against Raisl 6.0RC
* Loosen AR requirements. The gem will install for any AR version, but only ones listed in the README are supported
* Test against active Rubies

## 0.4.0 (2018-05-02)

### Breaking Changes

* Gemspec now requires Ruby 2.3 and later to install

### Features

* Dimension off of `datetime` columns by date parts in PostgreSQL (See README for details) (#10) - *niborg*

## 0.3.0 (2018-04-12)

### Bug Fixes

* Specify rescue from LoadError for ransack (#9) - *niborg*
* Fix ransack fallback logic (#8) - *germanotm*

### Misc

* Test against Rails 5.2
* Test against Ruby 2.5
* Drop support for Rails 5.0 (EOL-ed)
* Drop support for Ruby 2.2 (EOL-ed)

## 0.2.0 (2017-06-17)

### Breaking Changes

* `FactModel.use_model` renamed to `FactModel.model=`

### Bug Fixes

* `metric` lives on fact model and not metric (#3) - *wheeyls*

### Misc

* Readme corrections and updates (#2) - *wheeyls*

## 0.1.1 (2017-04-22)

### Bug Fixes

* Fix MySQL querying

### Misc

* Properly test against multiple dbs and versions of ActiveRecord in CI

## 0.1.0 (2017-04-16)

* Initial release
