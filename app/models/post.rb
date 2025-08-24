class Post < ApplicationRecord
  has_many :comments, dependent: :destroy # <-- IDAGDAG ITO!

  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 10 }
end
