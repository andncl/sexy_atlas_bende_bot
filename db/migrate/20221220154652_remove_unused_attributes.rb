class RemoveUnusedAttributes < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :phone_number
    remove_column :members, :telegram_id
    remove_column :meals, :opening_time
    remove_column :meals, :closing_time
  end
end
