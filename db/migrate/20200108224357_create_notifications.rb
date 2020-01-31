class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.integer :recipient_id
      t.string :recipient_type
      t.boolean :read, default: false
      t.integer :bid_id

      t.timestamps
    end
  end
end
