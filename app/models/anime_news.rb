class AnimeNews < ApplicationRecord
	def get_like
		x = LikeNews.where(anime_news_id:self.id).count
		if x>2
			return x.to_s+' likes'
		else
			return x.to_s+' like'
		end
	end
end
