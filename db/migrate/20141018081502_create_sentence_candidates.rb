class CreateSentenceCandidates < ActiveRecord::Migration
  def change
    create_table :sentence_candidates do |t|
      t.integer :sentence_id,  null: false
      t.text    :candidate
      t.float   :confidence,   null: false, default: 0
      t.timestamps
    end
    add_index :sentence_candidates, [:sentence_id, :confidence]
  end
end
