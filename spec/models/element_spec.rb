require 'spec_helper'

describe Element do
  it "no blank attributes" do
    element = Element.new
    assert_equal false, element.valid?
    assert_equal true, element.errors[:name].any?
    assert_equal true, element.errors[:body].any?
    assert_equal true, element.errors[:owner].any?
  end
  
  it "owner actually exists" do
    owner      = Factory.create :user
    element    = Factory.create :element, :owner => owner
    element_id = element.id
    assert_not_nil element.owner
    assert_equal owner, Element.find(element_id).owner
  end

end
