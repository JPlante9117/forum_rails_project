class SessionsController < ApplicationController
    before_action :disable_forum_style, only: [:new]

    def new
        redirect_if_logged_in
        @user = User.new
    end
    
    def create
        redirect_if_logged_in
        if params[:username]
            user = User.find_by(username: params[:username])
            unless user && user.authenticate(params[:password])
               flash.now.notice = "User and Password do not match"
               return render 'new'
            end
        else
            user = User.find_or_create_by(id: auth['uid']) do |u|
                u.username = auth['info']['nickname']
                u.password = SecureRandom.base64
            end
        end
        
        session[:user_id] = user.id
        check_banned_status(user)
        redirect_to root_path
    end

    def destroy
        redirect_if_logged_out
        reset_session
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
