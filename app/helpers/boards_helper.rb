module BoardsHelper

    def last_post(thread)
        unless thread.posts.empty?
            post = thread.posts.last
            if post.user
                user = post.user.username
            else
                user = "DELETED USER"
            end
            "Last Post By #{link_to user, user_path(user)} <br> #{display_full_date_time(post.created_at)}"
        end
    end

end
