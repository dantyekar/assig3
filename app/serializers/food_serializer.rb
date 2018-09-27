class FoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :category_id, :food_image
end
