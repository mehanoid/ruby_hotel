json.array!(@room_categories) do |room_category|
  json.extract! room_category, :name, :description
  json.url room_category_url(room_category, format: :json)
end
