class Admin::BoardsController < AdminController
  
    def index
        @boards = Board.all
    end

    def new
        @board = Board.new
        @categories = Category.all
    end

    def create
        @board = Board.new(board_params)
        if @board.save
            flash.notice = "Board successfully created!"
            redirect_to admin_boards_path
        else
            @categories = Category.all
            render 'new'
        end
    end

    def edit
        @board = Board.find_by_id(params[:id])
        @categories = Category.all
    end

    def update
        @board = Board.find_by_id(params[:id])
        if @board.update(board_params)
            flash.notice = "Board successfully updated!"
            redirect_to admin_boards_path
        else
            @categories = Category.all
            render 'edit'
        end
    end

    def destroy
        board = Board.find_by_id(params[:id])
        board.delete

        flash.notice = "Board deleted!"
        redirect_to admin_boards_path
    end

    private

    def board_params
        params.require(:board).permit(:title, :category_id, :description)
    end
end