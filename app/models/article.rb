class Article < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_favoritable
  # has_many :users, through: :bookmarks, as:
  # has_many :users, through: :comments
  validates :fake_news_validation, inclusion: { in: [true, false] }
end
