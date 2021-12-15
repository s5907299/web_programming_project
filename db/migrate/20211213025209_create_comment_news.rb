class CreateCommentNews < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_news do |t|
      t.references :user, null: false, foreign_key: true
      t.references :anime_news, null: false, foreign_key: true
      t.string :msg

      t.timestamps
    end
  end
end
