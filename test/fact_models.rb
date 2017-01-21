class PostFactModel < ActiveReporting::FactModel
  dimension :creator
  dimension :state

  dimension_filter :some_filter, ->(x) { where(creator_id: x) }
end

class UserFactModel < ActiveReporting::FactModel
  default_dimension_label :username
end
