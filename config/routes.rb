Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get '/dashboard', to: 'dashboard#index'

  resources :time_logs, only: [:create, :update]
end
