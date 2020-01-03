class BoardsController < ApplicationController

    def index
        @boards = Board.all
    end

    def show
        @board = Board.find_by_id(params[:id])
    end
    
end
