class OpsMailer < ActionMailer::Base
  default from: "opsgps@vmware.com"

  def confirmation_mail
    mail(to: "sugamasuhasini@vmware.com", subject: "Cron Job Done @stage server for vcenter data update")
  end

  def f5_confirmation_mail
    mail(to: "sugamasuhasini@vmware.com", subject: "F5 Cron Job Done@stg")
  end

  def f5_up_confirmation_mail
    mail(to: "sugamasuhasini@vmware.com", subject: "F5 Cron Job for f5 device  is Done@stg")

  end 
end
