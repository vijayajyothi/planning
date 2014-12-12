task :f5cronupdate => :environment do
  require 'csv'
  puts "started f5 update"
  F5Cluster.updating_f5_data
  puts "done"
  OpsMailer.f5_up_confirmation_mail.deliver
  p "f5 updation job done with sending a mail"
end

