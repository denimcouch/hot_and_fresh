Rails.application.routes.draw do
  resources :orders
  resources :recipes
  resources :items
  resources :bakeries, only: [:index, :show]
  resources :customers

  get '/sign_in', to: 'sessions#sign_in'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  root 'application#hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
