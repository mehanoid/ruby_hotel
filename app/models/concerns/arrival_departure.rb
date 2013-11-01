module Concerns
  module ArrivalDeparture
    extend ActiveSupport::Concern

    included do
      validates :arrival, :departure, presence: true
      validate :departure_later_than_arrival

      def self.overlapping_with(arrival, departure)
        where { |q|
          ((q.arrival >= arrival) & (q.arrival < departure))|
          ((q.departure > arrival) & (q.departure <= departure))
        }
      end
    end

    def departure_later_than_arrival
      if departure && arrival && departure <= arrival
        errors.add(:departure, 'должна быть позднее даты заезда')
      end
    end
  end
end