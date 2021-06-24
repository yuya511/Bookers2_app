class Book < ApplicationRecord
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
    
    
  #引数で渡されたuser_idのユーザがfavoritesテーブル内に存在するか確認している
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
 
  
  validates :title,
    presence: true
    
  validates :body,
    presence: true,
    length: { maximum: 200 }
    
end
