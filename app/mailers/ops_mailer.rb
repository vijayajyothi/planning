class OpsMailer < ActionMailer::Base
  default from: "vkalangi1989@gmail.com"

  def confirmation_mail
    mail(to: "vkalangi@vmware.com", subject: "Cron Job Done")
  end
end
