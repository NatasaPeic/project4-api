class User < ActiveRecord::Base
  include Authentication
  has_many :examples
  has_many :memories, inverse_of: :user, dependent: :destroy,
           foreign_key: 'user_id'
end
