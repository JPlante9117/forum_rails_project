module AdminHelper
    def category_errors_display(category)
        if category.errors.any?
            errors = category.errors.full_messages.map {|err| tag.li err}
            error_msg("Category", errors)
        end
    end

    def board_errors_display(board)
        if board.errors.any?
            errors = board.errors.full_messages.map {|err| tag.li err}
            error_msg("Board", errors)
        end
    end

    def error_msg(obj, error_arr)
        "There were some errors in creating your #{obj}: <ul>#{error_arr.join(" ")}</ul>"
    end
end