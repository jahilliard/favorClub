json.array!(@addresses) do |address|
  json.extract! address, :id, :name, :description, :streetAddress, :city, :zipCode, :state, :long, :lat
  json.url address_url(address, format: :json)
end
