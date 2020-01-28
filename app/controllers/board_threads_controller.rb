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

    def edit
        require_admin
        @boards = Board.all
        @board_thread = BoardThread.find_by_id(params[:id])
        @board = @board_thread.board
    end

    def update
        require_admin
        @board_thread = BoardThread.find_by_id(params[:id])
        if @board_thread.update(board_thread_params)
            flash.notice = "Thread successfully moved!"
            redirect_to board_thread_path(@board_thread)
        else
            flash.notice = "Invalid Board Selected, reverting changes."
            redirect_to board_thread_path(@board_thread)
        end
    end

    def show
        if params[:q]
            @board_thread = BoardThread.find_by_id(params[:id])
            user = User.find_by(username: params[:q])
            search_query(user)
        else
            @board_thread = BoardThread.find_by_id(params[:id])
            @posts = @board_thread.posts unless @board_thread.posts.empty?
        end
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

    def search_query(user)
        if user
            flash.notice = "Showing Posts by #{user.username}."
            @posts = Post.where("user_id = ? AND board_thread_id = ?", user.id, @board_thread.id)
            if @posts.empty?
                flash.now.notice = "#{user.username} has not posted in this thread."
                @posts = @board_thread.posts
            end
        else
            if !params[:q].blank?
                flash.now.notice = "No users named #{params[:q]}."
            end
            @posts = @board_thread.posts
        end
    end

end
