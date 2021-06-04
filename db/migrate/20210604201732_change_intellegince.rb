class ChangeIntellegince < ActiveRecord::Migration[5.2]
  def change
    rename_column :supers, :intellegince, :intelligence
  end
end
