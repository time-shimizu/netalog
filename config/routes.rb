Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  resources :users, only: [:show]
  resources :microposts
  resources :subcategories, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "staticpages#home"
end
