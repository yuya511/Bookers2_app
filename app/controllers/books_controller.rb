class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "new book create successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)

      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show

    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @book_comments = @book.book_comments
    @book_comment = BookComment.new

    @newbook = Book.new
  end

  def edit
    book = Book.find(params[:id])
    inuser = User.find(book.user_id)
    user = User.find(current_user.id)
    if inuser == user
      @book = Book.find(params[:id])
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "book update successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
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

end
