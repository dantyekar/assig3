class Administrator::FoodsController < Administrator::BaseController  

  def food_index
    @foods = Food.all.order(created_at: :desc)
  end

end