Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :turn_availability, only: %i[index create destroy]
      resources :turn, only: %i[index]
      resources :deal, only: %i[show]
    end
  end
end
