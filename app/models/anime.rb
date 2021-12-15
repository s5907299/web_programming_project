class Anime < ApplicationRecord
	def get_day
		if self.day_in_week
			return ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"].fetch(self.day_in_week)
		else
			return "a"
		end
	end
	def get_like
		x = LikeAnime.where(anime_id:self.id).count
		if x>2
			return x.to_s+' likes'
		else
			return x.to_s+' like'
		end
	end
end
