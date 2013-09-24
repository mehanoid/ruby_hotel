json.array!(@rooms) do |room|
  json.extract! room, :number, :category_id
  json.url room_url(room, format: :json)
end
