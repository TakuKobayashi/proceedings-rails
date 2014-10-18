class CreateSentLogs < ActiveRecord::Migration
  def change
    create_table :sent_logs do |t|
      t.integer :event_id, null: false
      t.string  :address, null: false
      t.timestamps
    end
    add_index :sent_logs, :event_id
    add_index :sent_logs, :address
  end
end
