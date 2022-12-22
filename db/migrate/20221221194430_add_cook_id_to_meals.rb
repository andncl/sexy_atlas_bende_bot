class AddCookIdToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :cook_id, :integer
    add_index :meals, :cook_id
  end
end
