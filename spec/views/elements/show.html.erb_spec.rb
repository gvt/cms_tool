require 'spec_helper'

describe "elements/show.html.erb" do
  before(:each) do
    @element = assign(:element, stub_model(Element,
      :name => "Name",
      :body => "Body",
      :user_id => "User"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Body/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/User/)
  end
end
