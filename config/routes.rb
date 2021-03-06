Rails.application.routes.draw do
  get 'attendances/create'
  get 'events/create'
  get 'events/show'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  root 'users#show'
  get '/', to: 'users#show'
  post '/', to: 'users#show'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  get '/add_event', to: 'events#new'
  post '/add_event', to: 'events#create'
  get '/show_event', to: 'events#show'
  get '/list_events', to: 'events#index'
  post '/list_events', to: 'events#index'
  post '/attendance', to: 'attendances#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
