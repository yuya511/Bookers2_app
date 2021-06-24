Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  
  resources :books, only: [:create, :show, :index, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :index, :edit, :update]
  
end
