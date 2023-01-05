# class BooksController < JSONAPI::ResourceController
#   skip_before_action :verify_authenticity_token
# end

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index
    # @books = Rails.cache.fetch(cache_key_with_version, expires_in: 7.days) do
    # Competitor::API.find_price(id)

    # end
    # @books = Book.search(params[:query])

    if params[:query]
      @books = Rails.cache.fetch(params[:query]) do
        Book.search(params[:query],expires_in: 7.days)
      end
    else
      @books = Book.all
    end
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
