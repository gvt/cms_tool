class Element < ActiveRecord::Base
  belongs_to :owner,  :class_name => "Account", :foreign_key => "owner_id"
  validates_presence_of :name, :body, :owner
  self.include_root_in_json = false
end
