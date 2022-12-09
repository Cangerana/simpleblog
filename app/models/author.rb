class Author < ApplicationRecord
    has_many :posts
    belongs_to :user, class_name: "User", foreign_key: "user_id"
end
