class Admin::StaticPagesController < AdminController
    def index
        @static_pages = StaticPage.all
    end

    def edit
        @static_page = StaticPage.find_by(title: params[:slug])
        session[:page_slug] = @static_page.title
    end

    def update
        @static_page = StaticPage.find_by(title: session[:page_slug])
        session.delete(:page_slug)
        if @static_page.update(static_pages_params)
            flash.notice = "Page successfully updated!"
            redirect_to admin_static_pages_path
        else
            render 'edit'
        end
    end

    private

    def static_pages_params
        params.require(:static_page).permit(:content)
    end
end