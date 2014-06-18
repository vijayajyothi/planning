task :cron => :environment do
  require 'csv'
  puts "started"
  Vm.importing_data
  puts "done"
end



# RAILS_ENV=development bundle exec rake cron --silent