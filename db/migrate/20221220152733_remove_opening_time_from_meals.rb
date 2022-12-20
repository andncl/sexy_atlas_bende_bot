class RemoveOpeningTimeFromMeals < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :phone_number
  end
end
