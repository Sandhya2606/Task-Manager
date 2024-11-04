Rails.application.routes.draw do
  devise_for :users

  # Routes for tasks with search functionality
  resources :tasks do
    collection do
      get "search"  # This will handle search queries
    end
  end

  root "tasks#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # API namespace for tasks (added this block)
  namespace :api do
    namespace :v1 do
      resources :tasks  # This will create RESTful routes for the API
    end
  end
end
