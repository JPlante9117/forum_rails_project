class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :admin?

    def logged_in?
        session[:user_id] ? true : false
    end

    def current_user
        User.find_by_id(session[:user_id])
    end

    def admin?
        current_user.admin
    end

    def redirect_if_logged_out
        if !logged_in?
            redirect_to root_path
        end
    end

    def require_admin
        if !current_user.admin
            redirect_to root_path
        end
    end

    def deslugger(slug)
        slug.gsub("-", " ")
    end
end
