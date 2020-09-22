Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books
  root 'home#top'
  get 'home/about' => 'home#about'
  resource :relationships, only: [:create, :destroy]
  resources :books, only: [:new, :create, :index, :show] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
