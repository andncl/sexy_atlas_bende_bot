class AddCookingFlagToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :eaters, :cooking, :boolean
    remove_column :users, :cook
  end
end
