class BoardThread < ApplicationRecord
    validates_presence_of :title

    has_many :posts
    has_many :users, through: :posts
    belongs_to :board

end
