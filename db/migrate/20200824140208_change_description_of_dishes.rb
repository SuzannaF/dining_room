class ChangeDescriptionOfDishes < ActiveRecord::Migration[6.0]
  def change
    change_column :dishes, :description, :text
  end
end
