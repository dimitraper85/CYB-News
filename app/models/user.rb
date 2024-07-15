class User < ApplicationRecord
  has_many :user_articles
  has_many :bookmarks
  has_many :comments
  has_many :articles, through: :bookmarks, as: :my_articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
