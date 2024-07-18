class UserArticlePercentage < ActiveRecord::Migration[7.1]
  def change
    add_column :user_articles, :probability, :decimal
  end
end
