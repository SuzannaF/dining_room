class ChangeDescriptionOfChefs < ActiveRecord::Migration[6.0]
  def change
    change_column :chefs, :description, :text
  end
end
