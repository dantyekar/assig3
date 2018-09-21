class Api::V1::FoodsController < ApiController

  def index
    foods = Food.all.order(created_at: :asc)
    render json: {status: 'SUCCESS', message: 'Loaded all foods', data: foods}, status: :ok
  end
end