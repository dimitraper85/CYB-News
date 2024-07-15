class Article < ApplicationRecord
  has_many :bookmarks
  has_many :comments
  # has_many :users, through: :bookmarks, as:
  # has_many :users, through: :comments
  validates :fake_news_validation, inclusion: { in: [true, false] }
end
