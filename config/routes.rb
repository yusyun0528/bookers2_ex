Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
	devise_for :users
  resources :users,only: [:show,:edit,:update,:index]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create]
  end

  resources :book_comments, only: [:destroy]

  root 'home#top'
  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
