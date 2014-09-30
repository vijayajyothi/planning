class UserMailer < ActionMailer::Base
  default from: "vkalangi1989@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end

  def account_confirmation(user)
    @user = user
    mail to: @user.email, subject: "Welcome!"
  end
  def confirmation_mail
    mail(to: "vkalangi@vmware.com", subject: "Cron Job Done")
  end
end
