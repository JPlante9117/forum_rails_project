module AdminHelper
    def category_errors_display(category)
        if category.errors.any?
            info = tag.div category.errors.full_messages.join("<br>").html_safe, class: "errors_list"  
        end
    end

    def board_errors_display(board, field)
        if board.errors["#{field}"].any?
            info = tag.div board.errors.full_messages_for("#{field}").join("<br>").html_safe, class: "errors_list"  
        end
    end

    def static_page_errors_display(static_page)
        if static_page.errors.any?
            info = tag.div static_page.errors.full_messages.join("<br>").html_safe, class: "errors_list"  
        end
    end

    def error_msg(obj, error_arr)
        "There were some errors in creating your #{obj}: <ul>#{error_arr.join(" ")}</ul>"
    end
end