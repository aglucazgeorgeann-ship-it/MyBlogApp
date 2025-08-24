# app/models/comment.rb
class Comment < ApplicationRecord
  # Each comment belongs to a specific post.
  belongs_to :post

  # Validations for the comment attributes.
  # The commenter's name must be present and at least 2 characters long.
  validates :commenter, presence: true, length: { minimum: 2 }
  # The comment body must be present and at least 5 characters long.
  validates :body, presence: true, length: { minimum: 5 }
end

