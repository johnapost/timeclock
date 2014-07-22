Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get '/dashboard', to: 'dashboard#index'
  get 'pdf/:id', to: 'pdfs#show', as: :pdf

  resources :time_logs, only: [:create, :update] do
    get 'get_time', to: 'time_logs#get_time', as: :get_time, on: :member
  end

  resources :users, only: [:index, :update] do
    delete '', to: 'users#destroy', as: :destroy, on: :member
    post '', to: 'users#create', as: :create, on: :collection
  end
end
