# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#

set :output, "/home/workspace/opsgps_development/cron_log.log"
#

# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every :day, :at=> '12:01am' do
  rake `rm -rf /home/workspace/opsgps_development/solr`
  rake "sunspot:solr:stop" 
  rake "sunspot:solr:start"
  rake "cron"
  rake "sunspot:solr:reindex"
  rake `chmod -R 777 solr`
end

# Learn more: http://github.com/javan/whenever

# Run below line for updating cronjobs after updating this file.
# whenever --update-crontab --set 'environment=development'

# RAILS_ENV=development bundle exec rake cron --silent
