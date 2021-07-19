Rails.application.routes.draw do 
  #sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get 'signup' => 'patients#new'

  root 'welcome#main'

  #auth
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :patients, except: [:index]
  resources :physicians 
  resources :appointments, only [:show, :update, :destroy]

  #nested
  resources :physicians do
    resources :appointments, only: [:index, :new, :create]
  end 

end
