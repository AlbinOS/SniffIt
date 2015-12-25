Rails.application.routes.draw do
  # Wines
  resources :wines

  # Homepage
  root 'welcome#index'
end
