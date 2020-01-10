module BoardThreadsHelper

    def lock_status(thread)
        if thread.locked
            "Locked"
        else
            "Unlocked"
        end
    end

        def thread_errors_display(board_thread, field)
        if board_thread.errors["#{field}"].any?
            info = tag.div board_thread.errors.full_messages_for("#{field}").join("<br>").html_safe, class: "errors_list"  
        end
    end
end
