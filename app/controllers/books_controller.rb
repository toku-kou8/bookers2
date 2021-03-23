class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
    
  end
  
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @bookc = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end


  private
  
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
end
