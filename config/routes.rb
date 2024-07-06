Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :turn_availability, only: %i[index create destroy]
    end
  end
end
