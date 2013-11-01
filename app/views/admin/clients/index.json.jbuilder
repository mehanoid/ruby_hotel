json.array!(@clients) do |client|
  json.extract! client, :first_name, :middle_name, :last_name, :birsday
  json.url client_url(client, format: :json)
end
