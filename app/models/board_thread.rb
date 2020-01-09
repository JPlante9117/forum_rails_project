class BoardThread < ApplicationRecord
    scope :with_long_title, -> {where("LENGTH(title) > 20")}
    validates_presence_of :title

    has_many :posts, dependent: :destroy
    has_many :users, through: :posts
    belongs_to :board

    accepts_nested_attributes_for :posts

end
