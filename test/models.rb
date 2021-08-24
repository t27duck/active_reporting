class Platform < ActiveRecord::Base
  has_many :games
  has_many :game_compatabilities
end

class Location < ActiveRecord::Base
  has_many :release_dates
end

class Series < ActiveRecord::Base
  self.table_name = 'series'

  has_many :figures
end

class Game < ActiveRecord::Base
  belongs_to :platform
  belongs_to :genre
  has_many :game_compatabilities
end

class Genre < ActiveRecord::Base
  has_many :games
end

class Figure < ActiveRecord::Base
  belongs_to :series
  has_many :release_dates, foreign_key: :amiibo_id
end

class ReleaseDate < ActiveRecord::Base
  belongs_to :amiibo, class_name: 'Figure'
  belongs_to :location
  belongs_to :released_on, class_name: 'DateDimension'
end

class GameCompatability < ActiveRecord::Base
  belongs_to :amiibo, class_name: 'Figure'
  belongs_to :game
  has_one :platform, through: :game
end

class DateDimension < ActiveRecord::Base
  self.primary_key = 'id'

  def self.new_from_date(date)
    new(id:           date.strftime('%Y%m%d'),
        year:         date.year,
        month:        date.month,
        day:          date.day,
        quarter:      (date.month / 3.0).ceil,
        date:         date)
  end
end

class User < ActiveRecord::Base
  has_one :profile
end

class Profile < ActiveRecord::Base
  belongs_to :user
end

class Sale < ActiveRecord::Base
  belongs_to :placed_at, class_name: 'DateDimension'
end
