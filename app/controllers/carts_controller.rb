class CartsController < ApplicationController
  def index
    @cart_items = session[:cart]
    @ordered_foods = {}
    @total = 0
    @cart_items.each do |food_id, qty|
      food = Food.find_by_id(food_id)
      @total += food.price * qty
      @ordered_foods[food_id] = { food: food, qty: qty}
    end unless session[:cart].nil?
    @current_order.ordered_items = @ordered_foods
    session[:order]['items'] = @ordered_foods
  end
  
  def destroy
    @cart.cart_data.delete(params[:id])
    redirect_to carts_path
  end

end
