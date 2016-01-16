Rails.application.routes.draw do
  # Users
  devise_for :users
  resources :users, only: [:show]

  # Wines/Tastings
  resources :wines do
    resources :tastings
  end

  # Homepage
  root 'welcome#index'
end
