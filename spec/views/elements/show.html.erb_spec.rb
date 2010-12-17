require 'spec_helper'

describe "elements/show.html.erb" do
  before(:each) do
    @element = assign(:element, Factory.create(:element))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(@element.name)
    rendered.should match(@element.body)
    rendered.should match(@element.owner.name)
  end
end
