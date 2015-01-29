json.array!(@users) do |user|
  json.extract! user, :id, :name, :password_digest, :role, :email
  json.url user_url(user, format: :json)
end
