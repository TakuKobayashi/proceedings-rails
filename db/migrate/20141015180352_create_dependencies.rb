class CreateDependencies < ActiveRecord::Migration
  def change
    create_table :dependencies do |t|
      t.integer :sentence_id,   null: false
      t.string  :word,          null: false
      t.timestamps
    end
    add_index :dependencies, :sentence_id
  end
end
