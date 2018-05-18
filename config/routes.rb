Rails.application.routes.draw do
  root to: 'hello#index'
  devise_for :users
  resources :food_items
  resources :menus
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
