class FigureFactModel < ActiveReporting::FactModel
  dimension :kind
  dimension :series

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

class PlatformFactModel < ActiveReporting::FactModel
  dimension_hierarchy %i[name]
end

class DateDimensionFactModel < ActiveReporting::FactModel
  default_dimension_label :date

  dimension_hierarchy [:date, :month, :year, :quarter]

  dimension_label_callback :quarter, ->(q) { "Q#{q}" }
end

class UserFactModel < ActiveReporting::FactModel
  default_dimension_label :username
  dimension :birthday_on
  dimension :created_at
end

class SaleFactModel < ActiveReporting::FactModel
  self.measure= :total

  dimension :placed_at
  dimension :item
end
