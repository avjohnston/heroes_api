class CreateSearch < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.integer :intelligence
      t.integer :strength
      t.integer :speed
      t.string :full_name
      t.string :publisher

      t.timestamps
    end
  end
end
