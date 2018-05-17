Rails.application.routes.draw do
  devise_for :users
  root to: 'hello#index'
  resources :food_items
  resources :menus
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
