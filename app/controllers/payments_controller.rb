class PaymentsController < ApplicationController

  def create
    if @order.save
      flash[:success] = 'Your order has been successfully placed.'
      redirect_to root_path
    else
      flash[:error] = 'An error occured while saving your order. Please try again.'
    end
  end
end