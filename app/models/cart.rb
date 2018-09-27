class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy

  def add_food(food)
    current_item = order_items.find_by(food_id: food.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.build(food_id: food.id)
    end
    current_item
  end

  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end
end