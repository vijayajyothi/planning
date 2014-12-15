class OpsMailer < ActionMailer::Base
  default from: "vkalangi1989@gmail.com"

  def confirmation_mail
    mail(to: "vkalangi@vmware.com", subject: "Cron Job Done")
  end

  def f5_confirmation_mail
    mail(to: "vkalangi@vmware.com", subject: "F5 Cron Job Done")
  end

  def f5_up_confirmation_mail
    mail(to: "vkalangi@vmware.com", subject: "F5 Cron Job new file update is Done")

  end 
end
