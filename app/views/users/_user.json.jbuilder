json.extract! user, :id, :name, :last_name, :username, :email, :password_digest, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
