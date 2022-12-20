class AddTelegramIdToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :telegram_id, :integer
  end
end
