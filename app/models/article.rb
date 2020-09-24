class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true

  default_scope { order(created_at: :desc)}
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_rich_text :body
end
