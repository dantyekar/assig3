class AddOrderToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :order, index: true, foreign_key: true
  end
end
