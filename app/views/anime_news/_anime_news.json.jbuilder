json.extract! anime_news, :id, :headline, :context, :created_at, :updated_at
json.url anime_news_url(anime_news, format: :json)
