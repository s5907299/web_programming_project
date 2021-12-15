json.extract! comment_anime, :id, :user_id, :anime_id, :msg, :created_at, :updated_at
json.url comment_anime_url(comment_anime, format: :json)
