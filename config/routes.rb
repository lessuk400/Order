Rails.application.routes.draw do
  root to: 'menus#index'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :food_items, only: %i[create new index]
  resources :menus,      only: %i[create new index]
  resources :orders,     only: %i[create new index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
