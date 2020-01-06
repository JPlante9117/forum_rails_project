class PostsController < ApplicationController
    def new
        @board_thread = BoardThread.find_by_id(params[:board_thread_id])
        @post = Post.new(board_thread_id: @board_thread.id)
    end

    def create
        post = Post.create(post_params)
        redirect_to board_thread_path(post.board_thread)
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:content, :board_thread_id, :user_id)
    end

end
