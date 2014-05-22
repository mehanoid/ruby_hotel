module Concerns
  # Данный модуль определяет функции и добавляет
  # валидации, связанные с данными о датах заселения и выселения
  # Предназначен для включения в модели Reservation и Placement
  module ArrivalDeparture
    extend ActiveSupport::Concern

    included do
      validates :arrival, :departure, presence: true
      validate :arrival_no_earlier_than_today, on: :create
      validate :departure_later_than_arrival

      # возвращает список объектов (броней или размещений)
      # период проживания у которых пересекается с указанным
      # периодом
      def self.overlapping_with(arrival, departure)
        where('arrival < ?', departure).where('departure > ?', arrival)
      end
    end


    # проверяет, пересекается ли период проживания у
    # текущего объекта с указанным периодом
    def overlaps_with?(arrival, departure)
      self.arrival < departure && self.departure > arrival
    end

    private

    # проверка того, что дата заселения не находится в прошлом
    def arrival_no_earlier_than_today
      if arrival && arrival < Date.today
        errors.add(:arrival, 'не может быть в прошлом')
      end
    end

    # проверка того, что дата заселения позднее даты заселения
    def departure_later_than_arrival
      if departure && arrival && departure <= arrival
        errors.add(:departure, 'должна быть позднее даты заезда')
      end
    end
  end
end