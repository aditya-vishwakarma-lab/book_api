class MailBookRecordJob < ApplicationJob
  queue_as :default

  def perform(*args)
    AdminMailer.mail_book_record($books).deliver_now
  end
end
