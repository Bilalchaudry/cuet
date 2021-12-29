class ClientMailer < ApplicationMailer
  default from: 'ceutisolpharma@gmail.com'

  def order_email_to_client
    @user = params[:user]
    mail(to: @user.email, subject: 'Order has been placed')
  end

  def welcome
    @user = params[:user]
    byebug
    mail(to: @user.email, subject: 'Welcome to cuetisol')
  end
end
