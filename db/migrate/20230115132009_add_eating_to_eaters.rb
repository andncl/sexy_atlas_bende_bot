class AddEatingToEaters < ActiveRecord::Migration[7.0]
  def change
    add_column :eaters, :eating, :boolean
  end
end
