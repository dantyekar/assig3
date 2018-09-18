class Administrator::BaseController < ApplicationController
  before_action :authorize_admin, only: [:show, :update]

  def update
    @title = 'orders'
    @orders = Order.all.paginate(page: params[:page], per_page: 10)
    @status = params['order']['status']
    @order_id = params[:order_id]
    @order = Order.find(@order_id)
    @order.update(status: @status)
    UserMailer.status_email(@order).deliver_now
    redirect_to dashboard_path
  end
end
