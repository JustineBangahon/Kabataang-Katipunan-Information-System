Rails.application.routes.draw do
  root to: 'sessions#new'


  get '/dashboard', to: 'kkmembers#dashboard', as: 'dashboard'
  get '/kkmembers', to: 'kkmembers#index', as: 'kkmembers'
  get '/kkmember/show/:id', to: 'kkmembers#show', as: 'kkmember_show'
  get '/kkmembers/new', to: 'kkmembers#new', as: 'new_kkmember'
  post '/kkmember/create', to: 'kkmembers#create', as: 'add_kkmember'
  get '/kkmembers/edit/:id', to: 'kkmembers#edit', as: 'edit_kkmember'
  patch '/kkmembers/update/:id', to: 'kkmembers#update', as: 'update_kkmember'
  delete '/kkmembers/destroy/:id', to: 'kkmembers#destroy', as: 'destroy_kkmember'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/show_purok', to: 'kkmembers#purok', as: 'purok'
  post '/kkmembers/purok/create', to: 'kkmembers#create_purok', as: 'add_purok'
  delete '/kkmembers/purok/destroy/:id', to: 'kkmembers#destroy_purok', as: 'destroy_purok'
end
