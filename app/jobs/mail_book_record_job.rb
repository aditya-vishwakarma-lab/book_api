require 'mongo'
require 'mongo/active_support'

class MailBookRecordJob < ApplicationJob
  queue_as :default

  def perform(*args)
    $books = Book.all
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')

    collection = client[:book]

    # docs = [ { _id: 1, name: 'Steve',
    #            hobbies: [ 'hiking', 'tennis', 'fly fishing' ],
    #            siblings: { brothers: 0, sisters: 1 } },
    #          { _id: 2, name: 'Sally',
    #            hobbies: ['skiing', 'stamp collecting' ],
    #            siblings: { brothers: 1, sisters: 0 } } ]

    $books.each do |book|
      collection.insert_one(book.as_json)
    end
    # collection.drop
    # puts collection.count_documents  # collection.

    AdminMailer.mail_book_record($books).deliver_now
  end
end
