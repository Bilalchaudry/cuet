class ClientMailer < ApplicationMailer
  default from: 'bilalahmer1995@gmail.com'

  def order_email_to_client(order)
    @user = params[:user]
    @order = order
    mail(to: @user.email, subject: 'Order has been placed')
  end

  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to cuetisol')
  end
end
