Rails.application.routes.draw do
  devise_for :users
 
  

  resources :places do
  	resources :reservations do
  		member do
        get "accept", "reject"
      end
  	end
  end
  
 


 resources :reservations, only: [:index, :create, :show] do
    member do
      put "accept"
      put "reject"
    end
  end

      



  
  


root 'places#index'

get 'pages/faq'
 
end
