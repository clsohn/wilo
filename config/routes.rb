Rails.application.routes.draw do
  root 'users#index'

  devise_for :users

  resources :users
  resources :locations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end

end
