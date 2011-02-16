require 'spec_helper'

describe Element do
  it "no blank attributes" do
    element = Element.new
    element.valid?.should be_false
    element.errors[:name].any?.should be_true
    element.errors[:body].any?.should be_true
    element.errors[:owner].any?.should be_true
  end
  
  it "owner actually exists" do
    owner      = Factory.create :account
    element    = Factory.create :element, :owner => owner
    element_id = element.id
    element.owner.nil?.should == false
    Element.find(element_id).owner.should == owner
  end

end
