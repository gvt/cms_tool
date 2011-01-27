class User < ActiveRecord::Base
  acts_as_authentic
  has_many :elements, :foreign_key => "owner_id"
  has_and_belongs_to_many :accounts
  validates_presence_of :accounts
  
  
  ##
  # creates a name so that this class can be used more generically
  def name
    login
  end
  # TODO: should we rename the "login" attrib?
  def name=(x)
    self[:login] = x
  end
end
