module Concerns
  module ArrivalDeparture
    extend ActiveSupport::Concern

    included do
      validates :arrival, :departure, presence: true
      validate :arrival_no_earlier_than_today, on: :create
      validate :departure_later_than_arrival

      def self.overlapping_with(arrival, departure)
        where { |q| (q.arrival < departure) & (q.departure > arrival) }
      end
    end

    def overlaps_with?(arrival, departure)
      self.arrival < departure && self.departure > arrival
    end

    private

    def arrival_no_earlier_than_today
      if arrival && arrival < Date.today
        errors.add(:arrival, 'не может быть в прошлом')
      end
    end

    def departure_later_than_arrival
      if departure && arrival && departure <= arrival
        errors.add(:departure, 'должна быть позднее даты заезда')
      end
    end
  end
end