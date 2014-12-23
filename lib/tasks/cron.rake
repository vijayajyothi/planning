task :cron => :environment do
  require 'csv'
  puts "started"
  Vm.importing_data
  puts "done"
  OpsMailer.confirmation_mail.deliver
  p "hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
  puts "started f5"
  F5Cluster.importing_f5_data
  puts "importing F5 is done"
  OpsMailer.f5_confirmation_mail.deliver
  p "f5 job done with sending a mail"
  puts "started f5 update"
  # F5Cluster.updating_f5_data
  puts "updating F5 with new file is done"
  OpsMailer.f5_up_confirmation_mail.deliver
  p "f5 updation job done with sending a mail"
end



# RAILS_ENV=development bundle exec rake cron --silent


# require 'csv'
# namespace :data do
#   task :import,[:filename] => :environment do
#     CSV.foreach('sample2.csv', :headers => true) do |row|
#        Cluster.create!(row.to_hash)
#     end

# #OpsMailer.test_email.deliver
#   end
# end 