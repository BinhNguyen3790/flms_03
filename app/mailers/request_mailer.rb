class RequestMailer < ApplicationMailer
  def request_email request
    @request = request
    mail to: @request.user_email, subject: t(".sun")
  end
end
