Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get '/dashboard', to: 'dashboard#index'

  resources :time_logs, only: [:create, :update]
  resources :users, only: [:index, :update] do
    delete '', to: 'users#destroy', as: :destroy, on: :member
    post '', to: 'users#create', as: :create, on: :member
  end
end
