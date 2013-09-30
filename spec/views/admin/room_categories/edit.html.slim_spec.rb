require 'spec_helper'

describe "admin/room_categories/edit" do
  before(:each) do
    @room_category = assign(:room_category, stub_model(RoomCategory,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit room_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_room_category_path(@room_category), "post" do
      assert_select "input#room_category_name[name=?]", "room_category[name]"
      assert_select "textarea#room_category_description[name=?]", "room_category[description]"
    end
  end
end
