Rails.application.routes.draw do
  # get 'books/new'
  # get 'books/show'
  # get 'books/update'
  # get 'books/create'
  # get 'books/index'
  # get 'books/edit'
  root "books#top"
  devise_for :users
  resources :users
  resources :books
  get "home/about" => "books#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
