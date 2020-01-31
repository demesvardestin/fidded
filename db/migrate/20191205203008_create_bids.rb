class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :item_request_id
      t.boolean :accepted, default: false
      t.integer :partner_id
      t.string :images, default: ""

      t.timestamps
    end
  end
end
