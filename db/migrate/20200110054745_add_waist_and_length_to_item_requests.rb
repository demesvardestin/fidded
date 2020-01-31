class AddWaistAndLengthToItemRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :item_requests, :waist, :string
    add_column :item_requests, :length, :string
    add_column :item_requests, :listed, :boolean, default: false
    add_column :item_requests, :negotiable, :boolean, default: false
    add_column :bids, :counter_offer, :string
    add_column :bids, :waist, :string
    add_column :bids, :length, :string
    remove_column :item_requests, :waist_length, :string
    remove_column :bids, :waist_length, :string
  end
end
