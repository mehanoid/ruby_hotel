json.array!(@accommodations) do |accommodation|
  json.extract! accommodation, 
  json.url accommodation_url(accommodation, format: :json)
end
