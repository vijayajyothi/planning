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

  def send_deleted_vms(vms)
    @vms= vms[1..10]
    mail(to: "vkalangi@vmware.com", subject: "Delted VMs list")
  end 


end
