json.array!(@favor_users) do |favor_user|
  json.extract! favor_user, :id, :favor_id, :user_id, :role, :notes
  json.url favor_user_url(favor_user, format: :json)
end
