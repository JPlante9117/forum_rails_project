class Board < ApplicationRecord
    validates :title, :presence => true,
                      :uniqueness => true
    
    validates_presence_of :category_id


    has_many :board_threads, dependent: :destroy
    has_many :posts, through: :board_threads
    belongs_to :category
    
end
