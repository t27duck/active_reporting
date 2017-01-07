class User < ActiveRecord::Base
  belongs_to :group
  has_many :posts
  has_many :comments
end

class Group < ActiveRecord::Base
  has_many :users
end

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end
