Rails.application.routes.draw do
  resources :users
  namespace :api, { format: 'json' } do
    resources :products

    namespace :v1 do
      resources :products
    end

    namespace :v2 do
      resources :products
    end
  end

  resources :products
  root to: 'products#index'
end
