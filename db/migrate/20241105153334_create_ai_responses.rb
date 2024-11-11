class CreateAiResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_responses do |t|
      t.references :user, null: false, foreign_key: true
      t.bigint :blob_id, null: false
      t.string :text

      t.timestamps
    end
    add_foreign_key :ai_responses, :active_storage_blobs, column: :blob_id
    add_index :ai_responses, :blob_id
  end
end
