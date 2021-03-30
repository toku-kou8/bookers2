Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'
  get "home/about" => "homes#about"
  delete "/books/:book_id/favorites" => "favorites#destroy", as: 'book_favorites'
  post "/books/:book_id/favorites" => "favorites#create", as: 'book_favorite'
  devise_for :users
  
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update, :index]

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
