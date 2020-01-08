module PostsHelper
    def quoted(quoteparams)
        <<-HTML
        <blockquote>
           #{quoteparams[:poster]} said at #{display_full_date_time(DateTime.parse(quoteparams[:timestamp]))}:
           <blockquote class="innerquote">
            #{quoteparams[:content]}
           </blockquote>
        </blockquote>
        HTML
    end
end
