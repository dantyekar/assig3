class Food < ActiveRecord::Base
  belongs_to :category

  has_many :order_items
  has_many :orders, through: :order_items
  
  has_attached_file :food_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default_food.jpg"
  validates_attachment_size :food_image, :in => 0.megabytes..10.megabytes
  validates_attachment_content_type :food_image, :content_type => /\Aimage\/.*\Z/

  private

    def ensure_not_referenced_by_any_order_item
      unless order_items.empty?
        errors.add(:base, 'Order Items present')
        throw :abort
      end
    end
end
