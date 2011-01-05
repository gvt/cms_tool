require 'spec_helper'

describe "elements/new.html.erb" do
  before(:each) do
    User.delete_all
    assign(:element, Factory.build(:element))
    assign(:users, [Factory.create(:user), Factory.create(:user)])
  end

  it "renders new element form" do
    render

    assert_select "form", :action => elements_path, :method => "post" do
      assert_select "input#element_name"   , :name => "element[name]"
      assert_select "textarea#element_body", :name => "element[body]"
      assert_select "select#element_owner_id"  , :name => "element[owner_id]"
    end
  end
end
