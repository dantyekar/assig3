class Api::V1::FoodsController < ApiController

  def index
    @foods = Food.all.order(created_at: :asc)
    render json: { data: @foods }
  end
end