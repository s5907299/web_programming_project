json.extract! like_news, :id, :user_id, :anime_news_id, :created_at, :updated_at
json.url like_news_url(like_news, format: :json)
