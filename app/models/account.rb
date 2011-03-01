class Account < ActiveRecord::Base
  has_one  :user
  has_many :elements

  accepts_nested_attributes_for :user
 
  validates_presence_of   :name
  validates_uniqueness_of :name
end
