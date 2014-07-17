Rails.application.routes.draw do
  get 'dashboard/index'

  root to: 'dashboard#index'
end
