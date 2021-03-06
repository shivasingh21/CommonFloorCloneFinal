Rails.application.routes.draw do
  root 'home#index'

  get 'signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'
  get "auth/:provider/callback", to: "sessions#social_login"


  resources :properties do
    member do
      get :approve
      get :change_property_status
      get :property_sell_rent_request
    end
    post 'comments', to: 'comments#create'
  end

  get 'favorites/update'

  namespace :admin do
    resources :categories, except: [:show]
  end

end
