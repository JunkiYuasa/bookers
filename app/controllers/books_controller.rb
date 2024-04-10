class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    flash[:notice] = "Successfully posted"
    redirect_to books_path
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  # ストロングパラメーター
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
