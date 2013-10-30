require 'spec_helper'

describe RoomCategory do

  describe 'free_room' do
    context 'with 2 rooms' do
      subject { create(:room_category_with_rooms, rooms_count: 2) }
      let(:arrival) { Date.parse('2013-10-02') }
      let(:departure) { arrival + 5.days }
      let(:first_room) { subject.rooms.first }
      let(:second_room) { subject.rooms.last }
      let(:free_room) { subject.free_room(arrival, departure) }

      context 'with first room reserved within given period' do
        before do
          create(:reservation, room: first_room, arrival: arrival, departure: departure)
        end

        it 'returns second room' do
          free_room.should eq second_room
        end
      end

      context 'with first room reserved before and after given period' do
        before do
          Timecop.travel 10.days.ago do
            create(:reservation, room: first_room, arrival: arrival - 10.days, departure: departure - 10.days)
            create(:reservation, room: first_room, arrival: arrival + 10.days, departure: departure + 10.days)
          end
        end

        it 'returns first room' do
          free_room.should eq first_room
        end
      end

      context 'without free rooms' do
        before do
          create(:reservation, room: first_room, arrival: arrival, departure: departure)
          create(:reservation, room: second_room, arrival: arrival, departure: departure)
        end

        it 'returns nil' do
          free_room.should be_nil
        end
      end
    end
  end
end
