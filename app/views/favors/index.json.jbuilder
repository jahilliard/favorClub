json.array!(@favors) do |favor|
  json.extract! favor, :id, :item, :description, :price, :requestLive, :addressId
  json.url favor_url(favor, format: :json)
end
