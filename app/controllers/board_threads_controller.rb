class BoardThreadsController < ApplicationController
    def new
        @board = Board.find_by_id(params[:board])
        @board_thread = BoardThread.new
        @board_thread.posts.build
    end

    def create
        @board = Board.find_by_id(params[:board])
        @board_thread = BoardThread.new(board_thread_params)
        # raise @board_thread.posts.inspect
        if @board_thread.save
            redirect_to board_thread_path(@board_thread)
        else
            render 'new'
        end
    end

    def show
        @board_thread = BoardThread.find_by_id(params[:id])
        @posts = @board_thread.posts
    end

    def destroy
        board_thread = BoardThread.find_by_id(params[:id])
        if admin?
            board_thread.delete

        else
            redirect_to root_path
        end
    end

    private

    def board_thread_params
        params.require(:board_thread).permit(:title, :board_id, posts_attributes: [
            :content,
            :board_thread_id,
            :user_id
        ])
    end

end
