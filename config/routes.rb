Rails.application.routes.draw do
  
  post "/api/v1/login", to: "api/v1/sessions#create"

  namespace :api do 
    namespace :v1 do 
      resources :users
      resources :groups
      resources :posts
      resources :recipes
      resources :comments
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
