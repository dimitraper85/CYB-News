class ArticleDatePub < ActiveRecord::Migration[7.1]
  def change
    change_column :articles, :pub_date, :datetime
  end
end
