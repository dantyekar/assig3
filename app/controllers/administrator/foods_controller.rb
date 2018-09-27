class Administrator::FoodsController < Administrator::BaseController  

  def index
    @foods = Food.all.order(created_at: :desc)
  end
end