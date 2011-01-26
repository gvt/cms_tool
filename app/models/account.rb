class Account < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  # account.name.gsub(/ /,'').downcase will create slug
end
