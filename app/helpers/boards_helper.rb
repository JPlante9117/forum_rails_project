module BoardsHelper

    def last_post(thread)
        post = thread.posts.last
        "Last Post By #{link_to post.user.username, user_path(post.user.username)} <br> #{display_full_date_time(post.created_at)}"
    end

end
