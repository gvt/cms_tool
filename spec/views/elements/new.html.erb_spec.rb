require 'spec_helper'

describe "elements/new.html.erb" do
  before(:each) do
    assign(:element, stub_model(Element,
      :name => "MyString",
      :body => "MyString",
      :user_id => "MyString" 
    ).as_new_record)
  end

  it "renders new element form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => elements_path, :method => "post" do
      assert_select "input#element_name", :name => "element[name]"
      assert_select "input#element_body", :name => "element[body]"
      assert_select "input#element_user_id", :name => "element[user_id]"
    end
  end
end
