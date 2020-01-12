class StaticController < ApplicationController
    def home
        @welcome = StaticPage.find_by(title: "Welcome")
    end

    def rules
        @rules = StaticPage.find_by(title: "Rules")
    end
end
