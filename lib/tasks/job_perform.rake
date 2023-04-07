namespace :job_perform do
  desc 'save book record in mongodb and email book record'
  task job_perform: :environment do
    SaveBookRecordJob.perform_now
    MailBookRecordJob.perform_now
  end
end
