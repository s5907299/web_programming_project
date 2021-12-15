class CommentAnime < ApplicationRecord
  belongs_to :user
  belongs_to :anime
end
