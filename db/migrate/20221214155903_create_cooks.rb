class CreateCooks < ActiveRecord::Migration[7.0]
  def change
    create_table :cooks do |t|
      t.string :first_name
      t.belongs_to :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
