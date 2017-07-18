Rails.application.routes.draw do
  devise_for :users
  root 'books#index'

  resources :books do
    post :take_book
    post :return_book

    resources :ratings, only: %i[create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
