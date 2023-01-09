class AddCookFlagToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cook, :boolean
  end
end
