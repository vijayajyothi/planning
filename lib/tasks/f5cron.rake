task :f5cron => :environment do
  require 'csv'
  puts "started f5"
  F5Cluster.importing_f5_data
  puts "done"
  OpsMailer.f5_confirmation_mail.deliver
  p "hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
end

