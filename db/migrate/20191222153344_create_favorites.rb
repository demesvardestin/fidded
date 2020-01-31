class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :item_request_id
      t.integer :partner_id

      t.timestamps
    end
  end
end
