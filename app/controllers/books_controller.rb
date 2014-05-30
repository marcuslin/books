class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    book_info = Book.get_book_info(book_params[:title], book_params[:author])

    @book.publisher = book_info['volumeInfo']['publisher']
    @book.description = book_info['volumeInfo']['description']
    @book.cover_thumb_url = book_info['volumeInfo']['imageLinks']['thumbnail']
    @book.cover_mid_url = book_info['volumeInfo']['imageLinks']['medium']

    @book.save

    if @book.save
      redirect_to books_path, notice: 'success'
    else
      render action: 'new', alert: 'failed'
    end
  end
end

private
  def book_params
    params.require(:book).permit(:title, :author, :publisher, :description, :cover_thumb_url, :cover_mid_url)
  end