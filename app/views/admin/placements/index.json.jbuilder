json.array!(@placements) do |placement|
  json.extract! placement, :room_id, :arrival, :departure, :accommodation_id
  json.url placement_url(placement, format: :json)
end
