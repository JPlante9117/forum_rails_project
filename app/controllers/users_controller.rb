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
        @user = User.find_by(username: deslugger(params[:slug]))
    end

    def update
        @user = User.find_by(id: params[:slug])
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
            params[:user].delete(:password)
            params[:user].delete(:password_confirmation)
        end
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def index
        @users = User.all
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :admin)
    end
end
