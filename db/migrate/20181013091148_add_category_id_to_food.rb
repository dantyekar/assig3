class AddCategoryIdToFood < ActiveRecord::Migration[5.2]
  def change
    add_reference :foods, :category, index: true, foreign_key: true
  end
end
