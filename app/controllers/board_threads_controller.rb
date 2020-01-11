class BoardThreadsController < ApplicationController
    before_action :redirect_if_logged_out
    def new
        @board = Board.find_by_id(params[:board_id])
        session[:board_id] = @board.id
        @board_thread = @board.board_threads.build
        @board_thread.posts.build
    end

    def create
        @board = Board.find_by_id(session[:board_id])
        session.delete(:board_id)
        @board_thread = @board.board_threads.build(board_thread_params)
        if @board_thread.save
            flash.notice = "Thread successfully created!"
            redirect_to board_thread_path(@board_thread)
        else
            render 'new'
        end
    end

    def show
        @board_thread = BoardThread.find_by_id(params[:id])
        @posts = @board_thread.posts unless @board_thread.posts.empty?
    end

    def destroy
        board_thread = BoardThread.find_by_id(params[:id])
        board = board_thread.board
        if admin?
            board_thread.delete
            flash.notice = "Thread deleted!"
            redirect_to board_path(board) and return
        end
        redirect_to board_path(board) and return
    end

    def lock
        swap_lock
    end

    private

    def board_thread_params
        params.require(:board_thread).permit(:title, :board_id, posts_attributes: [
            :content,
            :board_thread_id,
            :user_id
        ])
    end

    def swap_lock
        @board_thread = BoardThread.find_by_id(params[:board_thread_id])
        if admin?    
            @board_thread.locked = !@board_thread.locked
            @board_thread.save
        end
        redirect_to board_thread_path(@board_thread)
    end

end
