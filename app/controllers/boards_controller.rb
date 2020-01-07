class BoardsController < ApplicationController

    def index
        @categories = Category.all
    end

    def show
        @board = Board.find_by_id(params[:id])
        @board_threads = order_threads(@board)
    end
    
end
