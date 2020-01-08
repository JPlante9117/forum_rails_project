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
        match_user_or_admin(@user)
    end

    def update
        
        @user = User.find_by(username: deslugger(params[:user][:slug]))
        match_user_or_admin(@user)
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
            params[:user].delete(:password)
            params[:user].delete(:password_confirmation)
        end
        if @user.update(user_params)
            redirect_to user_path(@user.slug)
        else
            render 'edit'
        end
    end

    def index
        @users = User.all
    end

    def destroy
        @user = User.find_by(username: params[:user][:username])
        if @user == primary_admin
            redirect_to user_path(@user.username) and return
        end
        @user.delete

        redirect_to logout_path and return
    end

    def karma
        @user = User.find_by(username: deslugger(params[:user][:slug]))
        @user.karma += 1
        @user.update(user_params)

        redirect_to user_path(@user.slug)
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :admin, :karma)
    end

    def primary_admin
        User.find_by(id: 1)
    end
end
