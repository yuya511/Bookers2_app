class FavoritesController < ApplicationController

  def create
    #ネストしているためURLに:book_idが含まれている
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    
    path = Rails.application.routes.recognize_path(request.referer)
    
    if path[:controller] == "books" && path[:action] == "index"
      redirect_to books_path
    elsif path[:controller] == "books"
      redirect_to book_path(params[:book_id])
    elsif path[:controller] == "users"
      redirect_to user_path(current_user.id)
    else
      redirect_to books_path
    end

  end

  def destroy
    favorite = current_user.favorites.find_by(user_id: current_user.id ,book_id: params[:book_id])
    favorite.destroy
    
    path = Rails.application.routes.recognize_path(request.referer)

    if path[:controller] == "books" && path[:action] == "index"
      redirect_to books_path
    elsif path[:controller] == "books"
      redirect_to book_path(params[:book_id])
    elsif path[:controller] == "users"
      redirect_to user_path(current_user.id)
    else
      redirect_to books_path
    end

  end

end
