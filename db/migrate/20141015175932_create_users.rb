class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,        null: false
      t.string :auth_token,  null: false
      t.timestamps
    end
    add_index :users, :auth_token, unique: true
  end
end
