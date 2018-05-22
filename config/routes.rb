Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  root to: 'menus#index'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :food_items, only: %i[create new index]
  resources :menus,      only: %i[create new index]
  resources :orders,     only: %i[create new index]
=======
  devise_for :users
=======
>>>>>>> fceb1e1... added enum
  root to: 'hello#index'
  devise_for :users
  resources :food_items
  resources :menus
<<<<<<< HEAD
>>>>>>> 396c301... Wrodi pashe grobana forma
=======
  resources :orders
>>>>>>> 02a7fd6... Orders with OrderMeals
=======
  root to: 'menus#index'
  devise_for :users
<<<<<<< HEAD
  resources :food_items, only: [:create, :new, :index]
  resources :menus,      only: [:create, :new, :index]
  resources :orders,     only: [:create, :new, :index]
>>>>>>> 1b0a9e6... Added pundit
=======
  resources :food_items, only: %i[create new index]
  resources :menus,      only: %i[create new index]
  resources :orders,     only: %i[create new index]
>>>>>>> 4d9bc9a... Menu check
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
