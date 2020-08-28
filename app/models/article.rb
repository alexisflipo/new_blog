class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true

  default_scope { order(created_at: :desc)}
end
