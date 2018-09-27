class FoodsController < ApplicationController
  before_action :authorize_admin,
                only: [:create, :destroy, :update]
  before_action :set_food, only: [:show, :edit, :update, :destroy]


  def index
    @foods = Food.all.order(created_at: :asc)
  end

  def new
    @food = Food.new
  end

  def edit
  end

  def create
    @food = {}
    upload_image
    @food = Food.create(food_params)
    flash[:success] = "#{@food.name} has been added successfully."
    redirect_to dashboard_path
  end

  def show
  end

  def update
    upload_image if food_params[:food_image]
    if @food
      save_food
    else
      flash[:error] = "An error occured. Try adding #{@food.name} again."
    end
  end

  def destroy
    if @food
      @food.destroy
      flash[:success] = "#{food.name} has been deleted."
      redirect_to dashboard_path
    else
      flash[:error] = "An error occured. Try deleting #{@food.name} again."
    end
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:id, :name, :description, :price, :category_id, :food_image)
    end

    def upload_image
      image = food_params[:food_image]
      @food_image_url = false
      if image
        @upload = {}
        @upload[:food_image] = Cloudinary::Uploader.upload(image)
        @food_image_url = @upload[:food_image]['url']
        @food[:food_image_file_name] = @food_image_url
      end
      @food_image_url
    end

    def save_food
      @food[:food_image_file_name] = @food_image_url
      @food.update(food_params)
      flash[:success] = "#{@food.name} has been updated successfully."
      redirect_to dashboard_path
    end
end
