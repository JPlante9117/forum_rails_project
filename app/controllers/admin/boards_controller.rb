class Admin::BoardsController < ApplicationController
  
    def new
        @board = Board.new
    end

    def create
        board = Board.new(board_params)
    end

    def edit
        @board = Board.find_by_id(params[:id])
    end

    def update
    end

    def destroy
    end

    private

    def board_params
        params.require(:boards).permit(:title)
    end
end