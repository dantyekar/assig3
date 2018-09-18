class Administrator::CategoriesController < Administrator::BaseController

  def category_index
    @categories = Category.all.paginate(page: params[:page], per_page: 10)
  end

end