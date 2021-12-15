class CommentNews < ApplicationRecord
  belongs_to :user
  belongs_to :anime_news
end
