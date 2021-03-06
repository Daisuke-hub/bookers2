class BooksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:top, :about]
  before_action :correct_user, only: [:edit, :update]

  def top
  end
  
  def about
  end

  def create
    book = Book.new(book_params)
    book.user = current_user
    if book.save
      redirect_to book_path(book)
      flash[:success]="You have creatad book successfully."
    else
      @user = current_user
      @books = Book.all
      @book = book
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:success]="You have updated book successfully."
    else
      render "edit"
    end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user == current_user
        redirect_to books_path
    end
  end

end
