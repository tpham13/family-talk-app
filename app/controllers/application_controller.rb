class ApplicationController < ActionController::API
    
        def current_user
            User.find(session[:user_id])            
        end 

        def logged_in?
            # return a boolean rather than the current_user
            !!current_user
        end 
    
end
