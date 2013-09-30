require 'spec_helper'

describe "admin/rooms/edit" do
  before(:each) do
    @room = assign(:room, stub_model(Room,
                                     :number => 1,
                                     :category => nil
    ))
  end

  it "renders the edit room form" do
    render

    pending do
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", room_path(@room), "post" do
        assert_select "input#room_number[name=?]", "room[number]"
        assert_select "input#room_category[name=?]", "room[category]"
      end
    end
  end
end
