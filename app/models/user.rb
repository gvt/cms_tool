class User < ActiveRecord::Base
  acts_as_authentic
  has_many :elements, :foreign_key => "owner_id"
  belongs_to :account
  validates_presence_of :account
  
  
  ##
  # creates a name so that this class can be used more generically
  def name
    login
  end
end
