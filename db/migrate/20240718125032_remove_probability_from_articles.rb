class RemoveProbabilityFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :probability, :float
  end
end
