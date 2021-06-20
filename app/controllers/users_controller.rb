class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
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
