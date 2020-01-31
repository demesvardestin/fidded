class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :customer_id
      t.integer :partner_id

      t.timestamps
    end
  end
end
