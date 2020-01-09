module ApplicationHelper
    def display_date(data)
        if data.strftime("%m/%d/%Y") == Date.today.strftime("%m/%d/%Y")
            "Today"
        elsif data.strftime("%m/%d/%Y") == Date.today.prev_day.strftime("%m/%d/%Y")
            "Yesterday"
        else
            data.strftime("on %B %e")
        end
    end

    def display_time(data)
        data.strftime("at %I:%M%p")
    end

    def display_full_date_time(data)
        display_date(data) + " " + display_time(data)
    end

    def flash_message
        if flash[:notice]
            if flash[:notice].include?("successfully")
                tag.div "<br>#{flash[:notice].titlecase}<br><br>".html_safe, class: "flash_success"
            else
                tag.div "<br>#{flash[:notice].titlecase}<br><br>".html_safe, class: "flash_error"
            end
        end
    end
end
