class PostsController < ApplicationController
    before_action :redirect_if_logged_out
    def new
        @board_thread = BoardThread.find_by_id(params[:board_thread_id])
        redirect_if_locked
        @post = @board_thread.posts.build
    end

    def create
        protect_post_user_edits
        @board_thread = BoardThread.find_by_id(params[:board_thread_id])
        @post = @board_thread.posts.build(post_params)
        if @post.save
            flash.notice = "Post successfully created!"
            redirect_to board_thread_path(@post.board_thread)
        else
            render 'new'
        end
    end

    def edit
        @post = Post.find_by_id(params[:id])
        match_user_or_admin(@post.user)
    end

    def update
        remove_user_params_from_edit
        post = Post.find_by_id(params[:post][:post_id])
        if post.update(post_params)
            flash.notice = "Post successfully updated!"
            redirect_to board_thread_path(post.board_thread)
        else
            render 'edit'
        end
    end

    def destroy
        post = Post.find_by_id(params[:id])
        post.delete

        flash.notice = "Post deleted!"
        redirect_to board_thread_path(params[:board_thread_id])
    end

    private

    def post_params
        params.require(:post).permit(:content, :board_thread_id, :user_id, :updated_at)
    end

    def redirect_if_locked
        if @board_thread.locked
            flash.notice = "This thread is locked. New posts cannot be created."
            redirect_back(fallback_location: board_thread_path(@board_thread))
        end
    end

    def protect_post_user_edits
        if params[:post][:user_id] != current_user.id
            params[:post][:user_id] = current_user.id
        end
    end
    
    def remove_user_params_from_edit
        params[:post].delete :user_id
    end

end
