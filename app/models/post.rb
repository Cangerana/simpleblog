class Post < ApplicationRecord

  belongs_to :author
  belongs_to :tag

  validates_presence_of :content
end
