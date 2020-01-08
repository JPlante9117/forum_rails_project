class SessionsController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        if params[:username]
            user = User.find_by(username: params[:username])
            unless user && user.authenticate(params[:password])
               return render 'new'
            end
        else
            user = User.find_or_create_by(id: auth['uid']) do |u|
                u.username = auth['info']['name']
                u.password = SecureRandom.base64
            end
        end

        session[:user_id] = user.id

        redirect_to root_path
    end

    def destroy
        reset_session
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
