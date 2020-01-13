class UsersController < ApplicationController
    before_action :redirect_if_logged_out
    skip_before_action :redirect_if_logged_out, only: [:new, :create, :index]
    before_action :disable_forum_style, except: [:index]

    def new
        redirect_if_logged_in
        @user = User.new
    end

    def create
        redirect_if_logged_in
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash.notice = "Signup successful!"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def show
        @user = User.find_by(username: deslugger(params[:slug]))
    end

    def edit
        @user = User.find_by(username: deslugger(params[:slug]))
        match_user_or_admin(@user)
        session[:slug] = @user.slug
    end

    def update
        @user = User.find_by(username: deslugger(session[:slug]))
        session.delete(:slug)
        match_user_or_admin(@user)
        check_password_update
        default_avatar_if_necessary
        if @user.update(user_params)
            flash.notice = "Profile successfully updated!"
            redirect_to user_path(@user.slug)
        else
            render 'edit'
        end
    end

    def index
        @admins = User.admin
        @users = User.regular_user.where(banned: false)
        @banned_users = User.where(banned: true)
    end

    def destroy
        @user = User.find_by(username: params[:slug])
        if @user == primary_admin
            redirect_to user_path(@user.username) and return
        else
            if @user == current_user
                @user.posts.delete
                @user.delete
                flash.notice = "User deleted!"
                redirect_to logout_path and return
            else
                @user.posts.delete
                @user.delete
                flash.notice = "User deleted!"
                redirect_to root_path and return
            end
        end
    end

    def karma
        @user = User.find_by(username: deslugger(params[:user][:slug]))
        increase_karma(@user)
        @user.update(user_params)

        redirect_to user_path(@user.slug)
    end

    def banned
        @user = User.find_by(username: deslugger(params[:user][:slug]))
        swap_ban(@user)
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :admin, :karma, :avatar_url)
    end

    def primary_admin
        User.find_by(id: 1)
    end

    def increase_karma(user)
        user.karma += 1
    end

    def check_password_update
        if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
            params[:user].delete(:password)
            params[:user].delete(:password_confirmation)
        end
    end

    def default_avatar_if_necessary
        params[:user][:avatar_url] = "https://eitrawmaterials.eu/wp-content/uploads/2016/09/empty-avatar.jpg" if params[:user][:avatar_url].blank?
    end

    def swap_ban(user)
        if admin? && user != current_user    
            user.banned = !user.banned
            user.save
        end
        redirect_to user_path(user.slug)
    end
        
end
