Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'pages#home'

  get '/profile', to: "pages#profile"
  resources :suitcases, except: [:index, :show]

  resources :trips
end
