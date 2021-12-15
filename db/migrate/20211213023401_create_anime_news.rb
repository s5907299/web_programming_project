class CreateAnimeNews < ActiveRecord::Migration[6.1]
  def change
    create_table :anime_news do |t|
      t.string :headline
      t.string :context

      t.timestamps
    end
  end
end
