Rails.application.routes.draw do
#  get 'profiles/show'

  devise_for :users

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    post 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources :statuses

  get 'feed', to: 'statuses#index', as: :feed

  root to: 'statuses#index'

  get'/:profile_name', to: 'profiles#show', as: :user_profile


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
