require 'spec_helper'

describe "elements/index.html.erb" do
  before(:each) do
    assign(:elements, [Factory.create(:element), Factory.create(:element)])
      # stub_model(Element,
      #   :name => "Name",
      #   :body => "Body",
      #   :user_id => "User"
      # ),
      # stub_model(Element,
      #   :name => "Name",
      #   :body => "Body",
      #   :user_id => "User"
      # )
  end

  it "renders a list of elements" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
