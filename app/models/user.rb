class User < ApplicationRecord
    has_secure_password
    PASSWORD_REQUIREMENTS = /\A (?=.*\d) (?=.*([A-Z])) (?=.*([a-z])) (?=.*[[:^alnum:]]) (?=.{8,})/x
    CONTAINS_NUM = /\A (?=.*\d) /x
    CONTAINS_CAP = /\A (?=.*([A-Z])) /x
    CONTAINS_LOW = /\A (?=.*([a-z])) /x
    CONTAINS_SYM = /\A (?=.*[[:^alnum:]]) /x
    CONTAINS_CHA = /\A (?=.{8,}) /x
    
    validates :username,        
                        :uniqueness => true,
                        :presence => true,
                        :length => {:within => 6..40, :message => "must be at least 6 characters long"}

    validates :password, :format => {:with => CONTAINS_CAP, :message => "must contain an uppercase letter"}, :if => :password
    validates :password, :format => {:with => CONTAINS_LOW, :message => "must contain a lowercase letter"}, :if => :password
    validates :password, :format => {:with => CONTAINS_NUM, :message => "must contain a number"}, :if => :password
    validates :password, :format => {:with => CONTAINS_SYM, :message => "must contain a symbol"}, :if => :password
    validates :password, :format => {:with => CONTAINS_CHA, :message => "must contain at least 8 characters"}, :if => :password
    
    validates_presence_of :password_digest

    has_many :posts
    has_many :board_threads, through: :posts

    def slug
        self.username.gsub(" ", "-")
    end
end
