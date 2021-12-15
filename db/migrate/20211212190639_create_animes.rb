class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :name
      t.text :synosis
      t.integer :day_in_week
      t.time :show_time
      t.boolean :on_air
      t.integer :episode

      t.timestamps
    end
  end
end
