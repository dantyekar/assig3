class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :food, foreign_key: true
      t.belongs_to :cart, foreign_key: true

      t. timestamps
    end
  end
end