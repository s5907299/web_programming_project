class CreateSource0s < ActiveRecord::Migration[6.1]
  def change
    create_table :source0s do |t|
      t.references :anime, null: false, foreign_key: true
      t.references :platform1, null: false, foreign_key: true
      t.text :desc

      t.timestamps
    end
  end
end
