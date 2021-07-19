Rails.application.routes.draw do 
  #sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logut' => 'sessions#destroy'
  get 'signup' => 'patients#new'

  root 'welcome#main'

  #auth
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :patients, except: [:index]
  resources :physicians 
  resources :appointments 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
