require 'spec_helper'

describe RoomCategory do
  subject { create(:room_category_with_rooms, rooms_count: 2) }
  let(:first_room) { subject.rooms.first }
  let(:second_room) { subject.rooms.last }

  describe 'free_room' do
    context 'with 2 rooms' do
      let(:arrival) { 5.days.from_now }
      let(:departure) { 9.days.from_now }
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
          create(:reservation, room: first_room, arrival: 1.day.from_now, departure: 4.days.from_now)
          create(:reservation, room: first_room, arrival: 10.days.from_now, departure: 14.days.from_now)
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

  describe 'arrival and departure dates' do
    #assuming today is 2013-10-01
    describe 'if all rooms are reserved for some period' do
      before do
        subject.rooms.each do |room|
          create(:reservation, room: room, arrival: Date.parse('2013-10-06'), departure: Date.parse('2013-10-15'))
        end
      end

      describe 'available_arrival_dates' do
        it 'returns dates available for arrival' do
          dates = (Date.parse('2013-10-01')..Date.parse('2013-10-05')).to_a +
              (Date.parse('2013-10-15')..Date.parse('2013-10-20')).to_a
          available_dates, range = subject.available_arrival_dates(range_length: 20.days)

          range.should eq Date.parse('2013-10-01') .. Date.parse('2013-10-20')
          available_dates.should eq dates
        end
      end

      describe 'available_departure_dates' do
        it 'returns dates available for departure' do
          dates = (Date.parse('2013-10-05')..Date.parse('2013-10-06')).to_a
          available_dates, range = subject.available_departure_dates(arrival: Date.parse('2013-10-04'), range_length: 20.days)

          range.should eq Date.parse('2013-10-05') .. Date.parse('2013-10-21')
          available_dates.should eq dates
        end
      end
    end

    describe 'if only one room is reserved' do
      before do
        create(:reservation, room: first_room, arrival: Date.parse('2013-10-06'), departure: Date.parse('2013-10-15'))
      end

      describe 'available_arrival_dates' do
        it 'returns all dates' do
          dates = (Date.parse('2013-10-01')..Date.parse('2013-10-20')).to_a
          available_dates, _ = subject.available_arrival_dates(range_length: 20.days)

          available_dates.should eq dates
        end
      end

      describe 'available_departure_dates' do
        it 'returns all dates' do
          dates = (Date.parse('2013-10-05')..Date.parse('2013-10-21')).to_a
          available_dates, _ = subject.available_departure_dates(arrival: Date.parse('2013-10-04'), range_length: 20.days)

          available_dates.should eq dates
        end
      end
    end
  end
end
