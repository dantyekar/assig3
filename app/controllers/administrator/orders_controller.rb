class Administrator::OrdersController < Administrator::BaseController
  
  def index
    @orders = Order.all.paginate(page: params[:page], per_page: 10)
  end

  def update
    set_order
    @order.update(order_params)
    UserMailer.status_email(@order).deliver_now
    redirect_to dashboard_path
  end

  private

    def set_order
      @order = Order.find(params[:order_id])
    end

    def order_params
      params[:order].permit(:payment_status)
    end
end