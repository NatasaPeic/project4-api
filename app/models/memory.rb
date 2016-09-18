class Memory < ActiveRecord::Base
  belongs_to :user, inverse_of: :memories
end
