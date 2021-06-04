Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :search, only: %i[show new create]
    end
  end
end
