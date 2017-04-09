class User < ActiveRecord::Base
  belongs_to :group
  has_one :profile
  has_many :posts
  has_many :comments
end

class Profile < ActiveRecord::Base
  belongs_to :user
end

class Group < ActiveRecord::Base
  has_many :users
end

class Post < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :created_on, class_name: 'DateDimension'
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end

class Story < ActiveRecord::Base
  self.table_name = 'posts'
end

class DateDimension < ActiveRecord::Base
  def self.new_from_date(date)
    new(id:           date.strftime('%Y%m%d'),
        year:         date.year,
        month:        date.month,
        day:          date.day,
        quarter:      (date.month / 3.0).ceil,
        date:         date)
  end
end

class Metric
  @metrics = {
    a_metric: ActiveReporting::Metric.new(:a_metric, fact_model: PostFactModel)
  }
  def self.lookup(name)
    @metrics[name.to_sym]
  end
end
