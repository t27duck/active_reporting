class FigureFactModel < ActiveReporting::FactModel
  dimension :kind
  dimension :series

  aggregate_expression :kind_is_card, "CASE WHEN kind = 'amiibo card' THEN 1 END"
  aggregate_expression :kind_is_foo, "CASE WHEN kind = 'foo' THEN 1 END"
  aggregate_expression :return_20_when_card, "CASE WHEN kind = 'amiibo card' THEN 20 ELSE 0 END"

  dimension_filter :kind_is, ->(k) { where(kind: k) }
end

class ReleaseDateFactModel < ActiveReporting::FactModel
  dimension :amiibo
  dimension :location
  dimension :released_on
end

class GameCompatabilityFactModel < ActiveReporting::FactModel
  dimension :amiibo
  dimension :platform
  dimension :game
end

class GameFactModel < ActiveReporting::FactModel
  default_dimension_label :title
  dimension :platform
end

class SeriesFactModel < ActiveReporting::FactModel
end

class DateDimensionFactModel < ActiveReporting::FactModel
  default_dimension_label :date

  dimension_hierarchy [:date, :month, :year, :quarter]

  dimension_label_callback :quarter, ->(q) { "Q#{q}" }
end

class UserFactModel < ActiveReporting::FactModel
  default_dimension_label :username
  dimension :created_at
end

class SaleFactModel < ActiveReporting::FactModel
  self.measure= :total

  dimension :placed_at
  dimension :item
end
