class CreateSpends < ActiveRecord::Migration[7.0]
  def change
    create_table :spends do |t|
      t.integer :user_id
      t.float :amount
      t.integer :category
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
