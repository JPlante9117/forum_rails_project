module UsersHelper
    def errors(user, field)
        if user.errors["#{field}"].any?
            info = tag.div user.errors.full_messages_for("#{field}").join("<br>").html_safe, class: "errors_list"  
        end
        info.html_safe if info
    end

    def requirements(field)
        if field == "username"
            info = tag.span "This will be your display name. It must be at least 6 characters.", class: "note"
        elsif field == "password"
            info = <<-HTML
                    <span class="note">#{password_reqs}</span>
                    HTML
        end
        info.html_safe
    end

    def display_user_errors(user)
        if user.errors.any?
            errors = user.errors.full_messages.map {|err| tag.li err}
            profile_error_msg(errors)
        end
    end

    def profile_error_msg(errors)
        "There was an error updating the profile: <ul>#{errors.join(" ")}</ul>"
    end
    
    def password_reqs
        requirements = <<-REQS
            Passwords Must Contain:<br>
            One Uppercase Letter<br>
            One Lowercase Letter<br>
            One Symbol<br>
            One Number<br>
            At Least 8 Characters<br>
        REQS
        requirements.html_safe
    end

end
