class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #   http://127.0.0.1:3000/rails/mailers/user_mailer/welcome.txt?locale=es
  def welcome
    @user = params[:user]
    @username = @user.username

    mail to: @user.email
  end
end
