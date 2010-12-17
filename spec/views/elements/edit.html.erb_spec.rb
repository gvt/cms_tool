require 'spec_helper'

describe "elements/edit.html.erb" do
  before(:each) do
    @element = assign(:element, Factory.build(:element))
  end

  it "renders the edit element form" do
    render

    assert_select "form", :action => elements_path, :method => "post" do
      assert_select "input#element_name"    , :name => "element[name]"
      assert_select "textarea#element_body" , :name => "element[body]"
      assert_select "input#element_owner_id", :name => "element[owner_id]"
    end
  end
end
