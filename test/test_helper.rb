# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'simplecov'
SimpleCov.start

require 'active_reporting'

require 'minitest/autorun'

require 'support/database'
TestDatabase.connect

module DateTruncHelper
  # Reference implementation of Postgres' `date_trunc` (and `DATE()` for :date)
  def date_trunc(drill, time)
    case drill
    when :microseconds then time
    when :milliseconds then time.floor(3)
    when :second then time.floor
    when :minute then Time.utc(time.year, time.month, time.day, time.hour, time.min)
    when :hour then Time.utc(time.year, time.month, time.day, time.hour)
    when :day, :date then Time.utc(time.year, time.month, time.day)
    when :week then Time.utc(time.year, time.month, time.day) - ((time.wday - 1) % 7).days
    when :month then Time.utc(time.year, time.month)
    when :quarter then Time.utc(time.year, ((time.month - 1) / 3 * 3) + 1)
    when :year then Time.utc(time.year)
    when :decade then Time.utc(time.year / 10 * 10)
    when :century then Time.utc(((time.year - 1) / 100 * 100) + 1)
    when :millennium then Time.utc(((time.year - 1) / 1000 * 1000) + 1)
    end
  end

  def cast_time(value)
    value = ActiveRecord::Type::DateTime.new.cast(value.to_s) unless value.is_a?(Time)
    value.utc
  end
end

require 'schema'
require 'models'
require 'fact_models'
require 'seed'

class Metric
  @metrics = {
    a_metric: ActiveReporting::Metric.new(:a_metric, fact_model: FigureFactModel)
  }
  def self.lookup(name)
    @metrics[name.to_sym]
  end
end
