module BoardThreadsHelper

    def lock_status(thread)
        if thread.locked
            "Locked"
        else
            "Unlocked"
        end
    end

    def locked_image(thread)
        if thread.locked
            "http://tinyimg.io/i/EbCgeyb.png"
        else
            "http://tinyimg.io/i/S6KNI1M.png"
        end
    end

    def thread_errors_display(board_thread, field)
        if board_thread.errors["#{field}"].any?
            info = tag.div board_thread.errors.full_messages_for("#{field}").join("<br>").html_safe, class: "errors_list"  
        end
    end

    def created_or_updated_time(post)
        if post.created_at == post.updated_at
            "Posted #{display_full_date_time(post.created_at)}"
        else
            "Updated #{display_full_date_time(post.updated_at)}"
        end
    end
end
