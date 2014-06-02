require 'spec_helper'

describe Accommodation do
  let(:category) { create(:room_category_with_rooms) }

  describe 'create from reservation' do
    let(:reservation) { create(:reservation, room_category: category) }
    it 'should have one placement' do
      Accommodation.create!(reservation_id: reservation.id, client_attributes: attributes_for(:client_for_accommodation))
      expect(Accommodation.first.placements.count).to eq 1
    end
  end
end
