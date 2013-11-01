json.array!(@passports) do |passport|
  json.extract! passport, :number, :date_of_issue, :issuing_authority, :client_id
  json.url passport_url(passport, format: :json)
end
