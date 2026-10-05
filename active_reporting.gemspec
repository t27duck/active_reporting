# frozen_string_literal: true

require_relative 'lib/active_reporting/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_reporting'
  spec.version       = ActiveReporting::VERSION
  spec.authors       = ['Tony Drake']
  spec.email         = ['t27duck@gmail.com']

  spec.summary       = 'Add relational OLAP-like functionality for ActiveRecord'
  spec.description   = 'ActiveReporting implements ROLAP (Relational Online Analytical Processing) concepts ' \
                       'such as fact models, dimensions, and metrics on top of ActiveRecord, providing a DSL ' \
                       'for describing reports and analytics on your data.'
  spec.homepage      = 'https://github.com/t27duck/active_reporting'
  spec.license       = 'MIT'

  spec.metadata = {
    'bug_tracker_uri' => "#{spec.homepage}/issues",
    'changelog_uri' => "#{spec.homepage}/blob/main/CHANGELOG.md",
    'source_code_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true'
  }

  spec.files         = Dir['lib/**/*.rb', 'CHANGELOG.md', 'LICENSE.txt', 'README.md']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.3'

  spec.add_dependency 'activerecord', '>= 8.0'
  spec.add_dependency 'activesupport', '>= 8.0'
end
