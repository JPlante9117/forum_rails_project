class PostsController < ApplicationController
    def new
        @board_thread = BoardThread.find_by_id(params[:board_thread_id])
        redirect_if_locked
        @post = @board_thread.posts.build
    end

    def create
        @board_thread = BoardThread.find_by_id(params[:board_thread_id])
        @post = @board_thread.posts.build(post_params)
        if @post.save
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
        post = Post.find_by_id(params[:id])
        if post.update(post_params)
            redirect_to board_thread_path(post.board_thread)
        else
            render 'edit'
        end
    end

    def destroy
        post = Post.find_by_id(params[:id])
        post.delete
        redirect_to board_thread_path(params[:board_thread_id])
    end

    private

    def post_params
        params.require(:post).permit(:content, :board_thread_id, :user_id)
    end

    def redirect_if_locked
        if @board_thread.locked
            redirect_back(fallback_location: board_thread_path(@board_thread))
        end
    end

end
