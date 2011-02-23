require 'spec_helper'

describe Element do
  before (:each) do
    Element.delete_all
    Account.delete_all
  end
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

  it "produces proper JSON" do
    element = Factory.create :element
    json = element.to_json
    json.should eq "{\"name\":\"#{element.name}\",\"created_at\":\"#{element.created_at.xmlschema}\",\"body\":\"#{element.body}\",\"updated_at\":\"#{element.updated_at.xmlschema}\",\"owner_id\":#{element.owner.id},\"id\":#{element.id},\"publish_effective_at\":\"#{element.publish_effective_at.xmlschema}\"}"
  end
end