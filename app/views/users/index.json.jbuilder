json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :email, :fname, :lname, :rank, :phone
  json.url user_url(user, format: :json)
end
