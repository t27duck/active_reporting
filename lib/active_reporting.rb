require 'active_record'
require 'active_reporting/configuration'
require 'active_reporting/dimension'
require 'active_reporting/dimension_filter'
require 'active_reporting/error'
require 'active_reporting/metric'
require 'active_reporting/fact_model'
require 'active_reporting/report'
require 'active_reporting/version'

begin
  require 'ransack'
  ActiveReporting::Configuration.ransack_available = true
rescue
  ActiveReporting::Configuration.ransack_available = false
end
