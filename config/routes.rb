Rails.application.routes.draw do
  devise_for :users
 
  root 'places#index'

  get 'pages/faq'

  resources :places 
  resources :guests
  resources :reservations



 
end
