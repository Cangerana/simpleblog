Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'posts#index'

  resources :tags
  resources :posts
  resources :readers
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
