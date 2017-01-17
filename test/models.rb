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
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end

class Story < ActiveRecord::Base
  self.table_name = 'posts'
end
