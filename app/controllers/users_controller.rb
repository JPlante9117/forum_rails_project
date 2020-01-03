class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render 'new'
        end
    end

    def show
        redirect_if_logged_out
        @user = User.find_by(username: deslugger(params[:slug]))
    end

    def edit
        @user = User.find_by_id(current_user.id)
        #validate_user
    end

    def index
        @users = User.all
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
