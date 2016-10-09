Rails.application.routes.draw do

  root 'projects#index'

  resources :projects do
    resources :rewards
    resources :pledges
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
