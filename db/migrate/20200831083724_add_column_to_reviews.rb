class AddColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :rating_host, :integer
  end
end
