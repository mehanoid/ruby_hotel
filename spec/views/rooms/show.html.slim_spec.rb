require 'spec_helper'

describe "rooms/show" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
      :number => 1,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
