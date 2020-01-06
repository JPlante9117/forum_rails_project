class BoardsController < ApplicationController

    def index
        @boards = Board.all
    end

    def show
        @board = Board.find_by_id(params[:id])
        @board_threads = @board.board_threads
    end
    
end
