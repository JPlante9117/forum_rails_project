class Admin::UsersController < AdminController
    before_action :disable_forum_style, except: [:index]

    def update
        @user = User.find_by(username: deslugger(params[:slug]))
        if @user != primary_admin
            params[:user][:admin] = !@user.admin
            if @user.update(user_params)
                flash.notice = "User privileges successfully updated!"
                redirect_to admin_users_path
            else
                flash.notice = "User privileges were not updated."
                redirect_to admin_users_path
            end
        else
            flash.notice = "The Primary Administrator cannot be demoted."
            redirect_to admin_users_path
        end
    end

    def index
        @admins = User.admin
        @users = User.regular_user.where(banned: false)
    end

    private

    def user_params
        params.require(:user).permit(:admin)
    end

    def primary_admin
        User.find_by(id: 1)
    end
        
end
