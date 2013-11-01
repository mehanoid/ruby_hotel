json.array!(@emails) do |email|
  json.extract! email, :address, :contact_information_id
  json.url email_url(email, format: :json)
end
