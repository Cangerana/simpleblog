Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: "registrations",
                            omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'posts#index'

  resources :tags
  resources :posts
  resources :authors

  match '*unmatched', to: 'application#send_error_info', via: :all
end
