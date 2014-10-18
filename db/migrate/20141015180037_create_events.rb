class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.string  :type,   null: false
      t.integer :status, null: false
      t.string  :token,  null: false
      t.timestamps
    end
    add_index :events, :token, unique: true
    add_index :events, [:user_id, :type, :status]
  end
end
