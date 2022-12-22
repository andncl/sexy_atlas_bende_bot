class RenameMemberIdToUserIdInEaters < ActiveRecord::Migration[7.0]
  def change
    rename_column :eaters, :member_id, :user_id
  end
end
