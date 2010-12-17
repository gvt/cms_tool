require 'spec_helper'

describe "elements/index.html.erb" do
  before(:each) do
    assigns[:elements] = @elements = [Factory.create(:element), Factory.create(:element)]
  end

  it "renders a list of elements" do
    render
    @elements.each do |element|
      assert_select "tr>td", :text => element.name
      assert_select "tr>td", :text => element.body
      assert_select "tr>td", :text => element.owner.name
    end
  end
end
