class ApplicationController < ActionController::Base
  before_action :set_cart
  before_action :current_user
  before_action :load_current_order

  helper_method :current_order
  protect_from_forgery with: :exception
  include SessionsHelper

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def load_current_order
    session[:order] ||= {}
    @current_order ||= CurrentOrder.new(session[:order])
  end

end
