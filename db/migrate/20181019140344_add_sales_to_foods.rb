class AddSalesToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :sales, :text
  end
end
