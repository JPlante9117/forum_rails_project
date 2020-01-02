class User < ApplicationRecord
    has_secure_password
    PASSWORD_REQUIREMENTS = /\A (?=.*\d) (?=.*([A-Z])) (?=.*([a-z])) (?=.*[[:^alnum:]]) (?=.{8,})/x
    validates :username,        
                        :uniqueness => true,
                        :presence => true,
                        :length => {:within => 6..40}

    validates :password,
                        :format => {:with => PASSWORD_REQUIREMENTS}

    validates_presence_of :password_digest

    has_many :posts
    has_many :board_threads, through: :posts
end
