class CreateSearch < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.integer :min_intelligence
      t.integer :max_intelligence
      t.integer :min_strength
      t.integer :max_strength
      t.integer :min_speed
      t.integer :max_speed
      t.string :full_name
      t.string :publisher

      t.timestamps
    end
  end
end
