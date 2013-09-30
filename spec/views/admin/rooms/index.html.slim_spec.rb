require 'spec_helper'

describe "admin/rooms/index" do
  before(:each) do
    assign(:rooms, [
      stub_model(Room,
        :number => 1,
        :category => nil
      ),
      stub_model(Room,
        :number => 1,
        :category => nil
      )
    ])
  end

  it "renders a list of rooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
