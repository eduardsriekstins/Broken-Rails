Rails.application.routes.draw do
  get 'edit/show'
  get 'hidden', to: 'hidden#show'
  get 'update_profile', to: 'edit#update'
  resources :posts
  get 'about', to: 'pages#about'
  get 'logout', to:'sessions#destroy'
  get 'login', to: 'sessions#new'
  get 'edit_password', to: 'user#edit_password'

  resources :sessions
  resources :users do

  end

  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
