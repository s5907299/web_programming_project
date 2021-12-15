class CreatePlatform1s < ActiveRecord::Migration[6.1]
  def change
    create_table :platform1s do |t|
      t.string :name
      t.text :link

      t.timestamps
    end
  end
end
