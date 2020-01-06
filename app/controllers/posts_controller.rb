class PostsController < ApplicationController
    def new
        # raise params.inspect
        @board_thread = BoardThread.find_by_id(params[:board_thread_id])
        @post = @board_thread.posts.build
    end

    def create
        post = Post.create(post_params)
        raise post.inspect
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
