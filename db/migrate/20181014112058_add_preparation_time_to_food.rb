class AddPreparationTimeToFood < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :prep_time, :integer, :default => 12
  end
end
