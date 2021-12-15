json.extract! comment_news, :id, :user_id, :anime_news_id, :msg, :created_at, :updated_at
json.url comment_news_url(comment_news, format: :json)
