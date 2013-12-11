require 'spec_helper'

describe Placement do
  describe 'finish' do
    let!(:placement) { create(:placement) }
    it 'hide placement from active placements' do
      expect {
        placement.finish!
      }.to change { Placement.count }.by(-1)
    end
  end

  describe 'cost' do
    let!(:category) { create(:room_category_with_rooms, price: 1000) }
    let!(:placement) { create(:placement, room_category_id: category.id, departure: 3.days.from_now) }

    it 'is cost for 3 days' do
      placement.cost.should eq 3000
    end
  end
end
