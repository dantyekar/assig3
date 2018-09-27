class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def up
    Cart.all.each do |cart|
      sums = cart.order_items.group(:food_id).sum(:quantity)

      sums.each do |food_id, quantity|
        if quantity > 1
          cart.order_items.where(food_id: food_id).delete_all
          item = cart.order_items.build(food_id: food_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    OrderItem.where("quantity > 1").each do |order_item|
      order_item.quantity.times do
        OrderItem.create(
          cart_id: order_item.cart_id,
          food_id: order_item.food_id,
          quantity: 1
        )
      end
      order_item.destroy
    end
  end
end
