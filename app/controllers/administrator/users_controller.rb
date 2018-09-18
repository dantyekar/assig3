class Administrator::UsersController < Administrator::BaseController

  def user_index
    @users = User.all.paginate(page: params[:page],
                               per_page: 10).order(created_at: :desc)
  end

end