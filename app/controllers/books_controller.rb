class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books/search
  def search
    query = params[:query]
    version = Book.maximum(:updated_at).to_i # Get the latest update time of any book
    cache_key = "search_results:#{query}:#{version}"
    results = Rails.cache.fetch(cache_key, expires_in: 1.week) do
      Book.search(query)
    end
    render json: results
  end

  # GET /books
  def index
    @books = Book.all
    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author, :isbn, :description, :language, :cover)
  end

end
