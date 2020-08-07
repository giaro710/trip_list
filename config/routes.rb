Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'pages#home'

  get '/profile', to: "pages#profile"
  resources :suitcases, except: [:index, :show]


  resources :trips do
    resources :lists, except: [:index, :show, :new, :destroy] do
      resources :items, except: [:index, :show, :new, :destroy]
    end
  end

  resources :lists, only: [:destroy]
  resources :items, only: [:destroy]
end
