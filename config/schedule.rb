# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
set :environment, "development"
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every :day, :at => '3:00pm' do
  rake "cron"
  rake "sunspot:solr:stop" 
  rake "sunspot:solr:start"
  rake "sunspot:solr:reindex"
end

# Learn more: http://github.com/javan/whenever

# Run below line for updating cronjobs after updating this file.
# whenever --update-crontab --set 'environment=development'
# RAILS_ENV=development bundle exec rake test:cron --silent