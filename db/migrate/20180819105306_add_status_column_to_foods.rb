class AddStatusColumnToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :status, :string, :default => "available"
  end
end
