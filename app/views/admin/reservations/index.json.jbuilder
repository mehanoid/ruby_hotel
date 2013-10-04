json.array!(@reservations) do |reservation|
  json.extract! reservation, :room_id, :arrival, :departure
  json.url reservation_url(reservation, format: :json)
end
