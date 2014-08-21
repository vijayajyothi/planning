task :cron => :environment do
  require 'csv'
  puts "started"
  Vm.importing_data
  puts "done"
  OpsMailer.confirmation_mail.deliver
  p "hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
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