require 'spec_helper'

describe RoomsForm do

  it 'creates rooms range' do
    category = create(:room_category)
    expect {
      form = RoomsForm.new number_range_start: 1, number_range_end: 3, category_id: category.id
      form.save
    }.to change { Room.count }.by(3)
  end

  describe 'validates rooms uniqueness' do
    let(:category) { create(:room_category) }
    before do
      (1..3).each { |i| category.rooms.create(attributes_for(:room, number: i)) }
    end

    context 'when one room is exist' do
      it 'adds error message in for single room' do
        form = RoomsForm.new number_range_start: 1, number_range_end: 3, category_id: category.id
        form.should_not be_valid
        form.errors[:base].should include 'Номера 1, 2 и 3 уже существуют'
      end
    end

    context 'when many rooms are exist' do
      it 'adds error message in for multiple rooms' do
        form = RoomsForm.new number_range_start: 1, number_range_end: 1, category_id: category.id
        form.should_not be_valid
        form.errors[:base].should include 'Номер 1 уже существует'
      end
    end
  end
end
