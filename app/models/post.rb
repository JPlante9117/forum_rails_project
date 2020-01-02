class Post < ApplicationRecord
    validates_presence_of :content

    belongs_to :user
    belongs_to :board_thread
end
