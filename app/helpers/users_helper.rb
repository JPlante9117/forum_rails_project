module UsersHelper
    def errors_or_requirements(user, field)
        if user.errors["#{field}"].any?
            info = tag.div user.errors.full_messages_for("#{field}").join("<br>").html_safe, class: "errors_list"
        else
            if field == "username"
                info = tag.span "This will be your display name. It must be at least 6 characters.", class: "note"
            elsif field == "password"
                info = <<-HTML
                        <span class="note">#{password_reqs}</span>
                        HTML
            end
        end
        info.html_safe if info
    end

    def display_user_errors(user)
        if user.errors.any?
            errors = user.errors.full_messages.map {|err| tag.li err}
            error_msg(errors)
        end
    end

    def error_msg(errors)
        "There was an error updating the profile: <ul>#{errors.join(" ")}</ul>"
    end
    
    def password_reqs
        requirements = <<-REQS
        <dl>
            <dt>Passwords Must Contain:</dt>
            <dd>One Uppercase Letter</dd>
            <dd>One Lowercase Letter</dd>
            <dd>One Symbol</dd>
            <dd>One Number</dd>
            <dd>At Least 8 Characters</dd>
        </dl>
        REQS
        requirements.html_safe
    end

end
