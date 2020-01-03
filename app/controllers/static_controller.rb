class StaticController < ApplicationController
    def home
        raise current_user.inspect
    end
end
