Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "podcasts#index"
  resources :podcasts
end
