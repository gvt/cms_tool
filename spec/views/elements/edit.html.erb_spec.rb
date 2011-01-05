require 'spec_helper'

describe "elements/edit.html.erb" do
  before(:each) do
    User.delete_all
    @element = assign(:element, Factory.build(:element))
    assign(:users, [Factory.create(:user), Factory.create(:user)])
  end

  it "renders the edit element form" do
    render

    assert_select "form", :action => elements_path, :method => "post" do
      assert_select "input#element_name"    , :name => "element[name]"
      assert_select "textarea#element_body" , :name => "element[body]"
      assert_select "select#element_owner_id", :name => "element[owner_id]" do
        assert_select "option", {:count => 3}
      end
    end
    #trying to rewrite above code using should, but have_selector doesnt seem to be working
    #rendered.should have_selector("form[action=#{elements_path}][method=post]") do
      # with_tag("input[id=element_name][name = element[name]]")
      # rendered.should have_tag("textarea#element_body[name=element[body]]")
      # rendered.should have_tag()
    # end
  end
end
