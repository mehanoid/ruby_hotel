require 'spec_helper'

describe "rooms/new" do
  before(:each) do
    assign(:room, stub_model(Room,
                             :number => 1,
                             :category => nil
    ).as_new_record)
  end

  it "renders new room form" do
    render

    pending do
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", rooms_path, "post" do
        assert_select "input#room_number[name=?]", "room[number]"
        assert_select "input#room_category[name=?]", "room[category]"
      end
    end
  end
end
