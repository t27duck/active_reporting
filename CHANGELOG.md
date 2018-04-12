## 0.3.0 (Unrelased)

### Bug Fixes

* Specify rescue from LoadError for ransack (#9) *niborg*
* Fix ransack fallback logic *germanotm*

## Misc

* Test against Rails 5.2
* Test against Ruby 2.5
* Drop support for Rails 5.0 (EOL-ed)
* Drop support for Ruby 2.2 (EOL-ed)

## 0.2.0 (2017-06-17)

### Breaking Changes

* `FactModel.use_model` renamed to `FactModel.model=`

### Bug Fixes

* `metric` lives on fact model and not metric (#3) - *Michael Wheeler (wheeyls)*

### Misc

* Readme corrections and updates (#2) - *Michael Wheeler (wheeyls)*

## 0.1.1 (2017-04-22)

### Bug Fixes

* Fix MySQL querying

### Misc

* Properly test against multiple dbs and versions of ActiveRecord in CI

## 0.1.0 (2017-04-16)

* Initial release
