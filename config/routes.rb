Rails.application.routes.draw do
  root 'home#index'

  get 'signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :properties 
  # resources :categories, except: [:show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
