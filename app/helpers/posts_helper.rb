module PostsHelper
    def quoted(quoteparams)
        <<-HTML
        <blockquote>
           #{quoteparams[:poster]} said at #{quoteparams[:timestamp]}:
           <blockquote class="innerquote">
            #{quoteparams[:content]}
           </blockquote>
        </blockquote>
        HTML
    end
end
