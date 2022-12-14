class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.float :balance

      t.timestamps
    end
  end
end
