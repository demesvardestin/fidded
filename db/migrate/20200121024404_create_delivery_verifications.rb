class CreateDeliveryVerifications < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_verifications do |t|
      t.boolean :as_expected
      t.integer :satisfaction_level
      t.integer :bid_id

      t.timestamps
    end
  end
end
