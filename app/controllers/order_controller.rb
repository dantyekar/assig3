class OrderController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :create
  include CurrentCart
  
  before_action :set_cart, only: [:new, :create, :show]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :set_order, only: [:edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    if logged_in?
      @cart 
    else
      redirect_to login_path
    end
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = session[:user_id]
    @order.add_order_items_from_cart(@cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path
    else
      flash[:error] = 'An error occured while saving your order. Please try again.'
      redirect_to cart_checkout_path
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.permit(:invoice, :payment_status, :txn_id)
    end

    def ensure_cart_isnt_empty
      if @cart.order_items.empty?
        redirect_to root_path, notice: 'Your cart is empty'
      end
    end
end
