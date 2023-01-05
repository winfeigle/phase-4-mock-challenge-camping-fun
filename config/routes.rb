Rails.application.routes.draw do
  resources :campers, only: [:index]
  # resources :activities, only: [:index]
end
