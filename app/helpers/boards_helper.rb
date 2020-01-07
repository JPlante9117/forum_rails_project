module BoardsHelper

    def last_post(thread)
        "Last Post By #{thread.posts.last.user.username} <br> at #{thread.posts.last.created_at}"
    end

end
