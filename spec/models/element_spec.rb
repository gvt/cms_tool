require 'spec_helper'

describe Element do
  
  it "no blank attributes" do
    element = Element.new
    element.valid?.should be_false
    element.errors[:name].any?.should be_true
    element.errors[:body].any?.should be_true
    element.errors[:account].any?.should be_true
  end
  
  it "account actually exists" do
    account    = Factory.create :account
    element    = Factory.create :element, :account => account
    element_id = element.id
    element.account.nil?.should == false
    Element.find(element_id).account.should == account
  end

  describe "body method" do
    it "returns a HTML formatted body element" do
      element = Factory.create :element, :body => "*Hello*"
      element.body.should eq("<p><strong>Hello</strong></p>")
    end
    
    it "returns nil is body is nil" do
      element = Factory.build :element, :body => nil
      element.body.should be_nil
    end
    
    it "returns nothing is the body is blank" do
      element = Factory.build :element, :body => ""
      element.body.should eq("")
    end
  end
    
  describe "to_json" do
    it "works" do
      element = Factory.create :element
      json = element.to_json
      json.should eq "{\"name\":\"#{element.name}\",\"created_at\":\"#{element.created_at.xmlschema}\",\"body\":\"#{element.body}\",\"updated_at\":\"#{element.updated_at.xmlschema}\",\"account_id\":#{element.account.id},\"id\":#{element.id},\"publish_effective_at\":\"#{element.publish_effective_at.xmlschema}\"}"
    end

    it "works including textilized body" do
      element = Factory.create :element, :body => "*here* we go"
      hash = ActiveSupport::JSON.decode(element.to_json).symbolize_keys
      hash[:body].should include("<strong>here</strong>")
    end
  end
end