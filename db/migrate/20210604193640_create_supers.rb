class CreateSupers < ActiveRecord::Migration[5.2]
  def change
    create_table :supers do |t|
      t.string :name
      t.integer :intellegince
      t.integer :strength
      t.integer :speed
      t.string :gender
      t.string :race
      t.string :height
      t.string :weight
      t.string :first_appearance
      t.string :full_name
      t.string :publisher
      t.string :image

      t.timestamps
    end
  end
end
