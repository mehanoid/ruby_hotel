require 'spec_helper'

describe "room_categories/index" do
  before(:each) do
    assign(:room_categories, [
      stub_model(RoomCategory,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(RoomCategory,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of room_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
