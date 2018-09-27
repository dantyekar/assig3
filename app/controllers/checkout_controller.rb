class CheckoutController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]

  def show
    if logged_in?
      @cart 
    else
      redirect_to login_path
    end
  end
end
