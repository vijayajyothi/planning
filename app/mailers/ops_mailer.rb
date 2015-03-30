class OpsMailer < ActionMailer::Base
  default from: "opsgps@vmware.com"

  def confirmation_mail
    mail(to: "vkalangi@vmware.com", subject: "Cron Job Done production server")
  end

  def f5_confirmation_mail
    mail(to: "vkalangi@vmware.com", subject: "F5 Cron Job Done production server")
  end

  def f5_up_confirmation_mail
    mail(to: "vkalangi@vmware.com", subject: "F5 Cron Job new file update is Done production server")
  end 

  def send_deleted_vms(vms)
    @vms= vms[1..10]
    mail(to: "vkalangi@vmware.com", subject: "Delted VMs list")
  end 


end
