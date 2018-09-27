class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :foods, through: :order_items
  belongs_to :user

  validates :txn_id,  presence: true, uniqueness: { case_sensitive: false }
  default_scope{ order('created_at desc') }

  def add_order_items_from_cart(cart)
    cart.order_items.each do |item|
      item.cart_id = nil
      order_items << item
    end
  end

  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end
end
