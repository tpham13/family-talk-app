Rails.application.routes.draw do
  
  post "/api/v1/login", to: "api/v1/sessions#create"
  post "/api/v1/signup", to: "api/v1/users#create"
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"


  namespace :api do 
    namespace :v1 do 
      resources :groups 
      resources :users do 
        resources :posts 
         
      end
      resources :posts
      resources :posts do
        resources :comments
      end
      
      end 
      
      resources :posts
      resources :posts do
        resources :comments
      end 

    end
      resources :recipes
      resources :comments
    
end
    
  
