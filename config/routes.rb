Rails.application.routes.draw do
  resources :categories
  root 'home#index'
  devise_for :users, controllers: {registration: "registration"}
  resources :products
end
