class Post < ApplicationRecord
    validates_presence_of :content

    belongs_to :user
    belongs_to :board_thread

    def poster_username
        self.user.username
    end

end
