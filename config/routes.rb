Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'application#home', as: 'home'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :genres
  resources :users
  resources :carts
  resources :take_out_orders
  resources :menu_item_reviews
  resources :restaurant_reviews

  resources :menu_items, only: [:index, :edit, :update, :destroy]

  resources :menus, only: [:index, :edit, :update, :destroy] do
    resources :menu_items, only: [:new, :create, :show]
  end

  resources :restaurants do
    resources :menus, only: [:new, :create, :show]
  end



end
