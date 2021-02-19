class ApplicationController < ActionController::API
    
        def current_user
            # currently a mocked version of "being logged in"
            User.first 
        end 

        def logged_in?
            # return a boolean rather than the current_user
            !!current_user
        end 
    
end
