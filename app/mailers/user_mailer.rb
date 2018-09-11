class UserMailer < ApplicationMailer

  default :from => 'eurekacaffee@gmail.com'

  def welcome_email(user)
    @user = user
    mail( to: @user.email, subject: 'Welcome to Eureka Caffee!' )
  end

  def order_email(user, items)
    @current_order = JSON.parse(items)
    @user = user
    @order = @user.orders.last.id
    mail( to: @user.email, subject: "Your order:#{@order} is being processed" )
  end

  def status_email(order)
    @order = order
    @status = @order.Status
    @user = User.find(@order.user_id)
    mail( to: @user.email, subject: "Your order:#{@order.id} is now #{@status}" )
  end

end
