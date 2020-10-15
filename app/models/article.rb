class Article < ApplicationRecord
  validates :title, presence: true
  has_rich_text :body
  validates_presence_of :body
  validates :author, presence: true

  default_scope { order(created_at: :desc)}
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
