require 'spec_helper'

describe Accommodation do
  let(:category) { create(:room_category_with_rooms) }

  describe 'create from reservation' do
    let(:reservation) { create(:reservation, room: category.rooms.first) }
    it 'should have one placement' do
      Accommodation.create!(reservation_id: reservation.id, client_attributes: attributes_for(:client_for_accommodation))
      Accommodation.first.placements.count.should eq 1
    end
  end
end
