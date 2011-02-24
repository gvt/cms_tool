require 'spec_helper'

describe "elements/index.html.erb" do
  before :each do
    assigns[:elements] = @elements = [Factory.create(:element), Factory.create(:element)]
  end

  it "renders a list of elements" do
    render
    @elements.each do |element|
      assert_select "tr>td:nth-child(1)", :text => element.name
      assert_select "tr>td:nth-child(2)", :text => element.owner.name
      assert_select "tr>td:nth-child(3)", :text => element.publish_effective_at
      assert_select "tr>td:nth-child(4)", :text => "#{element.body.size} characters"
    end
  end
end
