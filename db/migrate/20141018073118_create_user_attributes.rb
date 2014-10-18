class CreateUserAttributes < ActiveRecord::Migration
  def change
    create_table :user_attributes do |t|
      t.integer :user_id, null: false
      t.string  :mail_address
      t.timestamps
    end
    add_index :user_attributes, :user_id
  end
end
