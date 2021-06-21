class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    
    @books = @user.books
  end

  def edit
    inuser = User.find(params[:id])
    user = User.find(current_user.id)
    if inuser == user
      @user = user
    else
      redirect_to user_path(user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:notice] = "user update successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
