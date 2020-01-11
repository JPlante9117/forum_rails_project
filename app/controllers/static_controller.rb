class StaticController < ApplicationController
    def home
        if logged_in?
            redirect_to boards_path
        end
    end

    def rules
        
    end
end
