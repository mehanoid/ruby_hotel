require 'spec_helper'

describe RoomCategory do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }

  describe 'free_room' do
    context 'with 2 rooms' do
      subject { create(:room_category_with_rooms, rooms_count: 2) }
      let(:arrival) { Date.parse('2013-10-01') }
      let(:departure) { arrival + 5.days }
      let(:first_room) { subject.rooms.first }
      let(:second_room) { subject.rooms.last }
      let(:free_room) { subject.free_room(arrival, departure) }

      context 'with first room reserved within given period' do
        before do
          first_room.reservations.create(arrival: arrival, departure: departure)
        end

        it 'returns second room' do
          free_room.should eq second_room
        end
      end

      context 'with first room reserved before and after given period' do
        before do
          first_room.reservations.create(arrival: arrival - 10.days, departure: departure - 10.days)
          first_room.reservations.create(arrival: arrival + 10.days, departure: departure + 10.days)
        end

        it 'returns first room' do
          free_room.should eq first_room
        end
      end

      context 'without free rooms' do
        before do
          first_room.reservations.create(arrival: arrival, departure: departure)
          second_room.reservations.create(arrival: arrival, departure: departure)
        end

        it 'returns nil' do
          puts 'reservations!!!'
          p Reservation.all
          free_room.should be_nil
        end
      end
    end
  end
end
