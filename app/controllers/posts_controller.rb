class PostsController < ApplicationController
    def new
        @board_thread = BoardThread.find_by_id(params[:board_thread_id])
        redirect_if_locked
        @post = @board_thread.posts.build(user_id: current_user.id)
    end

    def create
        post = Post.create(post_params)
        redirect_to board_thread_path(post.board_thread)
    end

    def edit
        raise params.inspect
        @post = Post.find_by_id(params[:id])
    end

    def update
    end

    def destroy
        post = Post.find_by_id(params[:post_id])
        post.delete
        redirect_to board_thread_path(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:content, :board_thread_id, :user_id)
    end

    def redirect_if_locked
        if @board_thread.locked
            redirect_to board_thread_path(@board_thread)
        end
    end

end
