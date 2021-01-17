Rails.application.routes.draw do
  get 'checkins/create'
  get 'trips/index'
  get 'trips/create'
  get 'trips/show'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  root 'sessions#welcome'
  #root 'trips#index'
  #get 'sessions/welcome'
  get 'users/new'
  get 'users/create'
  get 'home/index'
  resources :users, 
  only: [:new, :create]   
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'  
  get 'datamarker', to: 'users#datamarker'
  get 'saveLocation', to: 'users#saveLocation'   
  post 'login', to: 'sessions#create'   
  get 'welcome', to: 'sessions#welcome'
  get 'own/:username', to: 'sessions#own', as: "own"  
  get 'datamarkerown/:username', to: 'users#datamarkerown'   
  get 'authorized', to: 'sessions#page_requires_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips do
        resources :checkins, only: :create
   end
  end