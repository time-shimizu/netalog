Rails.application.routes.draw do
  get 'staticpages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "staticpages#home"
end
