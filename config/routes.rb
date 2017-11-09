Rails.application.routes.draw do
  
  root "landing#index"
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  resources :profiles, except: [:index]
  
  resources :household_items do
    resources :reviews
  end

  get '/my_listing' => 'household_items#my_listing'

  resources :conversations do
    resources :messages
  end

  resources :payments, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/support' => 'support#new'
  post '/support' => 'support#create'
  get 'landing/index'

 
end
