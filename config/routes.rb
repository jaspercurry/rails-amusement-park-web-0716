Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :sessions

  get '/', to: 'users#home', as: 'root_url'

  get '/signin', to: 'sessions#new', as: 'signin'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/ride', to: 'attractions#ride', as: 'ride'

  #get '/attractions/:id/edit', to: 'attractions#edit', as: "attraction/edit"
  #this has been changed numerous times...

end
