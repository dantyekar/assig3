class Administrator::CategoriesController < Administrator::BaseController

  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 10)
  end

end