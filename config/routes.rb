Rails.application.routes.draw do
  resources :bakeries, only: [:index, :show]
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end