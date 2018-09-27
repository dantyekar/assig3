class UsersController < ApplicationController
  before_action :authorize_admin, only: [:destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    upload_image(user_params[:avatar])
    @user[:avatar_file_name] = @avatar_url
    if @user.save
      log_in @user
      flash[:success] = "Welcome #{user_params[:first_name]} to Eureka Caffee!"
      UserMailer.welcome_email(@user).deliver_now      
      redirect_to root_path
    else
      flash[:error] = 'One or more required fields are missing'
      render 'new'
    end
  end

  def show
    args = args_params || {}
    if @user
      if args.present?
        @orders = @user.orders
        @title = args[:title] || 'Profile'
      else
        @orders = @user.orders.order(created_at: :desc).limit(3)
        @title = 'Recent Orders'
      end
    else
      flash[:message] = "We're sorry we couldn't find any information for this user."
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile Successfully Updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def upload_image(text)
    @upload = {}
    @upload[:avatar] = Cloudinary::Uploader.upload(text)
    @avatar_url = @upload[:avatar]['url']
  end

  def destroy
    if @user
      @user.destroy
      flash[:success] = "#{user.first_name} has been deleted."
      redirect_to dashboard_path
    else
      flash[:error] = "An error occured. Try deleting #{@user.first_name} again."
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end

    def args_params
      args = params.require(:args).permit(:show_all, :title) if params.has_key? 'args'
    end
end
