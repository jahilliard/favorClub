json.array!(@address_users) do |address_user|
  json.extract! address_user, :id, :address_id, :user_id
  json.url address_user_url(address_user, format: :json)
end
