class ApplicationController < ActionController::Base
  include SessionsHelper
  include CurrentCart
  before_action :set_cart
  before_action :current_user

  helper_method :current_order
  protect_from_forgery with: :exception
end
