Rails.application.routes.draw do

  root 'pages#index' 
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  
  
  resources :shops
  resources :backoffices

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
