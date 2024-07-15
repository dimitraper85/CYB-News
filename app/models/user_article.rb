class UserArticle < ApplicationRecord
  belongs_to :user

  validates :title, :content, presence: true
  validates :fake_news_validation, inclusion: { in: [true, false] }
end
