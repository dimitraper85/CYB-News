class AddProbabilityToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :probability, :decimal
  end
end
