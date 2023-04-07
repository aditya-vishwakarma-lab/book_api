class SaveBookRecordJob < ApplicationJob
  queue_as :default

  def perform(*args)
    $books = Book.all
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')

    collection = client[:book]
    collection.drop

    $books.each do |book|
      collection.insert_one(book.as_json)
    end
  end
end
