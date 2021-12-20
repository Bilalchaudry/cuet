class ClientMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_email_to_client
    @user = "bilalahmer1995@gmail.com"
    # @url  = 'http://example.com/login'
    mail(to: @user, subject: 'Order has been placed')
  end
end
