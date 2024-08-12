class BooksController < ApplicationController
 before_action :is_matching_login_user, only: [:edit, :update]
 #before_action :correct_user, only: [:edit] 
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @profile_image = @user.profile_image
    #@user1 = User.find(params[:id])
  end

  def show
    @book = Book.find(params[:id]) 
    @user = @book.user
    @book1 = Book.new
  end

  def edit
    @book = Book.find(params[:id]) 
  end
  
  def new
  @book = Book.new
  @book1 =Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @user = current_user
   if @book.save
     flash[:notice] = "You have created book successfully."
    redirect_to @book
   else
    render 'index'
    
   end
  end
  
  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
   else
    render 'edit'
   end 
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :id)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    #current_user.id = book.user.id
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
  
end
