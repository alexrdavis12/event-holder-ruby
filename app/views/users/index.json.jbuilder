json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :lastname, :firstname, :gender, :type
  json.url user_url(user, format: :json)
end
