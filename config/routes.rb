require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'matters#index'

  namespace :admin do
    mount Sidekiq::Web => '/sidekiq' # Sidekiq UI
  end

  resources :matters do
    post :autocomplete, on: :collection
  end
end
