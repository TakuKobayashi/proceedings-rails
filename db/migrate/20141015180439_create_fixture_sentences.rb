class CreateFixtureSentences < ActiveRecord::Migration
  def change
    create_table :fixture_sentences do |t|
      t.integer :sentence_id,  null: false
      t.integer :start_pos,    null: false
      t.integer :length,       null: false
      t.string  :surface,      null: false
      t.string  :shiteki_word
      t.string  :shiteki_info, null: false
      t.timestamps
    end
    add_index :fixture_sentences, :sentence_id
    add_index :fixture_sentences, :shiteki_info
  end
end
