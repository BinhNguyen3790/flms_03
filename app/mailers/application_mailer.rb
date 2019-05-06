class ApplicationMailer < ActionMailer::Base
  default from: Settings.mail_default
  layout "mailer"
end
