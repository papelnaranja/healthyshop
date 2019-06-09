Rails.application.routes.draw do


  get 'geocoder/findaddress'
  root 'pages#index'
  get 'backoffices/users'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      omniauth_callbacks:  'users/omniauth_callbacks'
  }
  
  
  resources :backoffices
  resources :users
  resources :shops do 
    member do
      post 'add_tag'
      delete 'remove_tag/:tag_id', to: 'shops#remove_tag', as: 'remove_tag'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
