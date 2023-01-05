
# namespace :email_sender  do
desc 'emails book record in present database'
task email_sender: :environment do
  MailBookRecordJob.perform_now
end
# end
