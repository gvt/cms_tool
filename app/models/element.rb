class Element < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :name, :body, :account
  self.include_root_in_json = false

  # returns the processed version of the body
  def body
    b = read_attribute :body
    return nil if b.nil?
    return ''  if b.blank?
    RedCloth.new(b).to_html
  end
end
