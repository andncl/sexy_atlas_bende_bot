class AddUserIdToCooks < ActiveRecord::Migration[7.0]
  def change
    add_column :cooks, :user_id, :integer
    add_index :cooks, :user_id
  end
end
