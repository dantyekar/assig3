class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment
      t.belongs_to :food
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
