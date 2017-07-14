Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books do
    post :take_book
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
