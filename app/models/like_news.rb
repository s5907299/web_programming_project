class LikeNews < ApplicationRecord
  belongs_to :user
  belongs_to :anime_news
end
