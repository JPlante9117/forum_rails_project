module ApplicationHelper
    def display_date(data)
        if data.strftime("%m/%d/%Y") == Date.today.strftime("%m/%d/%Y")
            "Today"
        elsif data.strftime("%m/%d/%y") == Date.today.prev_day.strftime("%m/%d/%Y")
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
end
