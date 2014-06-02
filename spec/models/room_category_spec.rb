require 'spec_helper'

describe RoomCategory do
  subject { create(:room_category_with_rooms, rooms_count: 2) }
  let(:first_room) { subject.rooms.first }
  let(:second_room) { subject.rooms.last }

  let(:arrival) { 5.days.from_now }
  let(:departure) { 9.days.from_now }

  describe 'free_room' do
    context 'with 2 rooms' do
      let(:free_room) { subject.free_room(arrival, departure) }

      context 'with one reservation within given period' do
        before do
          create(:reservation, room_category: subject, arrival: arrival, departure: departure)
        end

        it 'returns first room' do
          expect(free_room).to eq first_room
        end
      end

      context 'with one room occupied within given period' do
        before do
          create(:placement, room_category_id: subject, departure: departure)
        end

        it 'returns second room' do
          expect(free_room).to eq second_room
        end

        context 'with two reservations before and after given period' do
          before do
            create(:reservation, room_category: subject, arrival: 1.day.from_now, departure: 4.days.from_now)
            create(:reservation, room_category: subject, arrival: 10.days.from_now, departure: 14.days.from_now)
          end

          it 'returns second room' do
            expect(free_room).to eq second_room
          end
        end

        context 'with one reservation within given period' do
          before do
            create(:reservation, room_category: subject, arrival: arrival, departure: departure)
          end

          it 'returns nil' do
            expect(free_room).to be_nil
          end
        end
      end

      context 'with two reservations within given period' do
        before do
          create(:reservation, room_category: subject, arrival: arrival, departure: departure)
          create(:reservation, room_category: subject, arrival: arrival, departure: departure)
        end

        it 'returns nil' do
          expect(free_room).to be_nil
        end
      end
    end
  end

  describe 'reserved_room' do
    context 'with 2 rooms' do
      let(:reserved_room) { subject.reserved_room(arrival, departure) }

      context 'with one room occupied within given period' do
        before do
          create(:placement, room_category_id: subject, departure: departure)
        end
        context 'with one reservation within given period' do
          before do
            create(:reservation, room_category: subject, arrival: arrival, departure: departure)
          end

          it 'returns second room' do
            expect(reserved_room).to eq second_room
          end
        end
      end
    end
  end

  describe 'arrival and departure dates' do
    #assuming today is 2013-10-01
    describe 'if all rooms are reserved for some period' do
      before do
        subject.rooms.count.times do
          create(:reservation, room_category: subject, arrival: Date.parse('2013-10-06'), departure: Date.parse('2013-10-15'))
        end
      end

      describe 'available_arrival_dates' do
        it 'returns dates available for arrival' do
          available_dates, range = subject.available_arrival_dates(range_length: 20.days)

          expect(range).to eq Date.parse('2013-10-01') .. Date.parse('2013-10-20')
          expect(available_dates).to eq (Date.parse('2013-10-01')..Date.parse('2013-10-05')).to_a +
                                        (Date.parse('2013-10-15')..Date.parse('2013-10-20')).to_a
        end
      end

      describe 'available_departure_dates' do
        it 'returns dates available for departure' do
          available_dates, range = subject.available_departure_dates(arrival: Date.parse('2013-10-04'), range_length: 20.days)

          expect(range).to eq Date.parse('2013-10-05') .. Date.parse('2013-10-21')
          expect(available_dates).to eq (Date.parse('2013-10-05')..Date.parse('2013-10-06')).to_a
        end
      end
    end

    describe 'if all rooms are occupied for some period' do
      before do
        subject.rooms.count.times do
          create(:placement, room_category_id: subject, departure: Date.parse('2013-10-15'))
        end
      end

      describe 'available_arrival_dates' do
        it 'returns dates available for arrival' do
          available_dates, range = subject.available_arrival_dates(range_length: 20.days)

          expect(range).to eq Date.parse('2013-10-01') .. Date.parse('2013-10-20')
          expect(available_dates).to eq (Date.parse('2013-10-15')..Date.parse('2013-10-20')).to_a
        end
      end

      describe 'available_departure_dates' do
        it 'returns dates available for departure' do
          available_dates, range = subject.available_departure_dates(arrival: Date.parse('2013-10-16'), range_length: 20.days)

          expect(range).to eq Date.parse('2013-10-17') .. Date.parse('2013-10-21')
          expect(available_dates).to eq (Date.parse('2013-10-17')..Date.parse('2013-10-21')).to_a
        end
      end
    end

    describe 'if only one room is reserved' do
      before do
        create(:reservation, room_category: subject, arrival: Date.parse('2013-10-06'), departure: Date.parse('2013-10-15'))
      end

      describe 'available_arrival_dates' do
        it 'returns all dates' do
          available_dates, _ = subject.available_arrival_dates(range_length: 20.days)

          expect(available_dates).to eq (Date.parse('2013-10-01')..Date.parse('2013-10-20')).to_a
        end
      end

      describe 'available_departure_dates' do
        it 'returns all dates' do
          available_dates, _ = subject.available_departure_dates(arrival: Date.parse('2013-10-04'), range_length: 20.days)

          expect(available_dates).to eq (Date.parse('2013-10-05')..Date.parse('2013-10-21')).to_a
        end
      end
    end
  end
end
