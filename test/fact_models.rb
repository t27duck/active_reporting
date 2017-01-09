class PostFactModel < ActiveReporting::FactModel
  dimension :creator
  dimension :state

  dimension_filter :some_filter, ->(x) { where(creator_id: x) }
end
