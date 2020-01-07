class Admin::CategoriesController < AdminController
    def index
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(cat_params)
        if @category.save
            redirect_to admin_categories_path
        else
            render 'new'
        end
    end

    def edit
        @category = Category.find_by_id(params[:id])
    end

    def update
        @category = Category.find_by_id(params[:id])
        if @category.update(cat_params)
            redirect_to admin_categories_path
        else
            render 'edit'
        end
    end

    def destroy
        category = Category.find_by_id(params[:id])
        category.delete

        redirect_to admin_categories_path
    end

    private

    def cat_params
        params.require(:category).permit(:title)
    end
end