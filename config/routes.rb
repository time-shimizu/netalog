Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "staticpages#home"
  get "/search", to: "microposts#search"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  resources :users, only: [:show, :following, :followers] do
    member do
      get :following, :followers
    end
  end
  resources :microposts
  resources :subcategories, only: [:show]
  resources :scores, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :replies, only: [:create, :destroy]
  resources :infos, only: :index
end
