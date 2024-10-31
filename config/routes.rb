Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  root 'gossips#index'

  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'

  get 'welcome', to: 'static#welcome' 
  get 'welcome/:name', to: 'static#welcome' 
  
  resources :gossips
  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users
  resources :cities

  resources :sessions, only: [:new, :create, :destroy]

  get "login", to: "sessions#new", as: "login"# Route pour la connexion
  post "login", to: "sessions#create" # Route pour la création de session
  delete "logout", to: "sessions#destroy", as: "logout" #Route pour la déconnexion
end
