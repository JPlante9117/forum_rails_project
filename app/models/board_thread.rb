class BoardThread < ApplicationRecord
    validates_presence_of :title

    has_many :posts, dependent: :destroy
    has_many :users, through: :posts
    belongs_to :board

    accepts_nested_attributes_for :posts

end
