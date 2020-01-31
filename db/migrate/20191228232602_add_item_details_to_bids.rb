class AddItemDetailsToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :item_size, :string, default: ""
    add_column :bids, :item_brand, :string, default: ""
    add_column :bids, :item_description, :string, default: ""
    add_column :bids, :item_condition, :string, default: ""
    add_column :bids, :waist_length, :string, default: ""
    add_column :bids, :men_or_women, :string, default: ""
    
    ## add more options to item_requests
    add_column :item_requests, :waist_length, :string, default: ""
    add_column :item_requests, :men_or_women, :string, default: ""
  end
end
