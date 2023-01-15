class AddMessageIdToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :message_id, :integer
  end
end
