Rails.application.routes.draw do
  devise_for :users
  # Wines
  resources :wines do
    resources :tastings
  end

  # Homepage
  root 'welcome#index'
end
