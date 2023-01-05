class AdminMailer < ApplicationMailer
  def mail_book_record(books)
    @books=books
    mail(
      to: 'vishwakarmaaditya03@gmail.com',
      subject: "There are #{@books.count} currently in your record."
    )
  end
end
