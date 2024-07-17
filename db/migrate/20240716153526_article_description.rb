class ArticleDescription < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :description, :string
    change_column_default :articles, :fake_news_validation, false
  end
end
