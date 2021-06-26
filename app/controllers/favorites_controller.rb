class FavoritesController < ApplicationController

  def create
    #ネストしているためURLに:book_idが含まれている
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save

    if params[:favorite_id].to_i == 1
      redirect_to book_path(params[:book_id])
    else
      redirect_to books_path
    end

  end

  def destroy
    favorite = current_user.favorites.find_by(user_id: current_user.id ,book_id: params[:book_id])
    favorite.destroy

    if params[:favorite_id].to_i == 1
      redirect_to book_path(params[:book_id])
    else
      redirect_to books_path
    end

  end

end
