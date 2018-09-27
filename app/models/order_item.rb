class OrderItem < ActiveRecord::Base
  belongs_to :food, optional: true
  belongs_to :order, optional: true
  belongs_to :cart

  def total_price
    food.price * quantity
  end
end
