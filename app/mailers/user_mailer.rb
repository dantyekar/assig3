class UserMailer < ApplicationMailer
  default :from => 'eurekacaffee@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Eureka Caffee!')
  end

  def order_email(user, items)
    @current_order = JSON.parse(items)
    @user = user
    mail(to: @user.email, subject: "Your order:#{@user.orders.last.id} is being processed")
  end

  def status_email(order)
    @order = order
    @user = User.find(@order.user_id)
    mail(to: @user.email, subject: "Your order:#{@order.id} is now #{@order.payment_status}")
  end
end
