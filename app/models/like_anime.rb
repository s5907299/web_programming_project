class LikeAnime < ApplicationRecord
  belongs_to :user
  belongs_to :anime
end
