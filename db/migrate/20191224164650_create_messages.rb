class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :sender_type
      t.integer :conversation_id
      t.text :body, default: ""
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
