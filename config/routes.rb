Rails.application.routes.draw do
  resources :registrations, only: [:create]
end
