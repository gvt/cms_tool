class User < ActiveRecord::Base
  acts_as_authentic
  has_many :elements, :foreign_key => "owner_id"
end
