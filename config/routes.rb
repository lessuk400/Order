Rails.application.routes.draw do
  root to: 'menus#index'
  devise_for :users
  resources :food_items, only: [:create, :new, :index]
  resources :menus,      only: [:create, :new, :index]
  resources :orders,     only: [:create, :new, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
