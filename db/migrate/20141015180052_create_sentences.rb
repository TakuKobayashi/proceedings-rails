class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.integer :event_id,      null: false
      t.text    :origin_sentence
      t.text    :fixture_sentence
      t.integer :status,        null: false
      t.string  :language_code, null: false
      t.timestamps
    end
    add_index :sentences, :event_id
    add_index :sentences, :status
  end
end
