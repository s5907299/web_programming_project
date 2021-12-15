class CreateCommentAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_animes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true
      t.string :msg

      t.timestamps
    end
  end
end
