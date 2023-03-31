class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@running_for_everyone.com"
  layout "mailer"
end
