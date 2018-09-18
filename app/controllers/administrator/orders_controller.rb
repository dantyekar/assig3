class Administrator::OrdersController < Administrator::BaseController

  def order_index
    @orders = Order.all.paginate(page: params[:page], per_page: 10)
  end

end