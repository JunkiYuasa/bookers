class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      flash[:notice] = "successfully posted"
      redirect_to books_path
    else
      flash.now[:alert] = "unsuccessfully posted"
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully updated"
      redirect_to book_path(book.id)
    else
      flash.now[:alert] = "unsuccessfully updated"
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "successfully destroyed"
    redirect_to books_path
  end
  
  # ストロングパラメーター
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
