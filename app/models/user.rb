class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :account

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
