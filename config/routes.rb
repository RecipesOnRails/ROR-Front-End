Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/kroger/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'dashboard', to: 'dashboard#show'
  get '/recipes/:id', to: 'recipes#show'
end
