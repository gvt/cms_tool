class Element < ActiveRecord::Base
  belongs_to :owner,  :class_name => "Account", :foreign_key => "owner_id"
  validates_presence_of :name, :body, :owner
  self.include_root_in_json = false

  # returns the processed version of the body
  def body
    b = read_attribute :body
    return nil if b.nil?
    return ''  if b.blank?
    RedCloth.new(b).to_html
  end
end
