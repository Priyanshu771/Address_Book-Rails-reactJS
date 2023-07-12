Rails.application.routes.draw do
  namespace :api do
    resources :contacts, only: [:index, :create, :destroy]
  end

  root 'api/contacts#index'
end
