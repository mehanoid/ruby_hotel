require 'spec_helper'

describe Reservation do
  describe 'default scope' do
    let!(:expired_reservation) { Timecop.travel(10.days.ago) { create(:reservation) } }
    let!(:canceled_reservation) { create(:reservation, canceled: true) }
    let!(:active_reservation) { create(:reservation) }

    it 'returns active reservations' do
      expect(Reservation.all).to eq [active_reservation]
    end
  end
end

