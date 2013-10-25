json.array!(@phones) do |phone|
  json.extract! phone, :number, :contact_information_id
  json.url phone_url(phone, format: :json)
end
