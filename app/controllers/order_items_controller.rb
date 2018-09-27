class OrderItemsController < ApplicationController
  include CurrentCart  
  before_action :set_cart, only: [:create]
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
  end

  def edit
  end

  def create
    @food = Food.find(params[:food_id])
    @order_item = @cart.add_food(@food)

    if @order_item.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def update
    if @order_item.update(order_item_params)
      redirect_to @order_item, notice: 'Order item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order_item.destroy
    redirect_to order_items_url, notice: 'Order item was successfully destroyed.'
  end

  private

    def set_order_item
      @order_item = OrderItem.find(params[:food_id] || params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:food_id, :order_id)
    end
end
