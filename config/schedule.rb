set :output, './log/cron_log.log'
every :day, at: '6:00pm' do
  rake "job_perform:job_perform", environment: "development"
end
