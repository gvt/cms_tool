class User < ActiveRecord::Base
  acts_as_authentic
  has_many :elements, :foreign_key => "owner_id"
  belongs_to :account
  validates_presence_of :account
end
