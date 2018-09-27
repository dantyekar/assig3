class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    if admin?
      @category = Category.create(category_params)
      if @category
        flash[:success] = 'New category created'
        redirect_to dashboard_path
      else
        flash[:failure] = 'Error in creating category'
      end
    end
  end

  def edit
  end

  def show
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:title, :description)
    end
end
