class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :require_admin, :admin?

    def logged_in?
        session[:user_id] ? true : false
    end

    def redirect_if_logged_in
        if logged_in?
            redirect_back(fallback_location: root_path)
        end
    end

    def current_user
        User.find_by_id(session[:user_id])
    end

    def admin?
        current_user.admin
    end

    def redirect_if_logged_out
        if !logged_in?
            flash.notice = "To access this feature, please sign in"
            redirect_back(fallback_location: root_path)
        end
    end

    def require_admin
        unless current_user && current_user.admin
            redirect_back(fallback_location: root_path)
        end
    end

    def deslugger(slug)
        slug.gsub("-", " ")
    end

    def order_threads(board)
        board.board_threads.sort_by do |thread|
            if !thread.posts.empty?
                thread.posts.last.created_at
            else
                DateTime.new
            end
        end.reverse!
    end

    
    def match_user_or_admin(user)
        unless user == current_user || admin?
            redirect_back(fallback_location: root_path)
        end
    end
end
