class ClientMailer < ApplicationMailer
  default from: 'info@ceutisolpharma.com'

  def order_email_to_client(order)
    @user = params[:user]
    @order = order
    mail(to: @user.email, subject: 'Order has been placed')
  end

  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to cuetisol')
  end

  def shipped
    @order = params[:order]
    @user = @order.client
    mail(to: @user.email, subject: 'Your package is on its way!')
  end

  def delivered
    @order = params[:order]
    @user = @order.client
    mail(to: @user.email, subject: 'Order is delivered')
  end

  def cancelled
    @order = params[:order]
    @user = @order.client
    mail(to: @user.email, subject: 'Order is cancelled')
  end
end
