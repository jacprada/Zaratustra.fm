json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :name, :bio, :profile_image, :background_image
  json.url user_url(user, format: :json)
end
