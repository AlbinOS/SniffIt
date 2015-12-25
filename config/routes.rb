Rails.application.routes.draw do
  # Wines
  resources :wines do
    resources :tastings
  end

  # Homepage
  root 'welcome#index'
end
