require 'spec_helper'

describe "elements/edit.html.erb" do
  before(:each) do
    @element = assign(:element, stub_model(Element,
      :new_record? => false,
      :name => "MyString",
      :body => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders the edit element form" do
    render

    assert_select "form", :action => element_path(@element), :method => "post" do
      assert_select "input#element_name"   , :name => "element[name]"
      assert_select "textarea#element_body", :name => "element[body]"
      assert_select "input#element_user_id", :name => "element[user_id]"
    end
  end
end
