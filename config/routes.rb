Rails.application.routes.draw do

  get 'geocoder/findaddress'
  root 'pages#index' 
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks:  'users/omniauth_callbacks'
  }
  
  
  resources :shops
  resources :backoffices

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
