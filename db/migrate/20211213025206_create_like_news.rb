class CreateLikeNews < ActiveRecord::Migration[6.1]
  def change
    create_table :like_news do |t|
      t.references :user, null: false, foreign_key: true
      t.references :anime_news, null: false, foreign_key: true

      t.timestamps
    end
  end
end
