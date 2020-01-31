class CreateItemRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :item_requests do |t|
      t.integer :fit_pic_id
      t.string :item_name
      t.text :item_description
      t.string :item_size
      t.string :item_brand
      t.string :price_offer
      t.boolean :claimed, default: false

      t.timestamps
    end
  end
end
