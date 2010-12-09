require 'spec_helper'

describe "elements/index.html.erb" do
  before(:each) do
    assign(:elements, [
      stub_model(Element,
        :name => "Name",
        :body => "Body",
        :user_id => "User"
      ),
      stub_model(Element,
        :name => "Name",
        :body => "Body",
        :user_id => "User"
      )
    ])
  end

  it "renders a list of elements" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
