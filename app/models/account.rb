class Account < ActiveRecord::Base
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :users
  validates_presence_of :name
  validates_uniqueness_of :name
  before_save :make_subdomain
  
  def make_subdomain
    self.subdomain = name.to_slug
  end
end
