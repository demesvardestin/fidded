class AddItemNameToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :item_name, :string
    add_column :bids, :declined, :boolean
    add_column :bids, :decline_reason, :string
    add_column :bids, :confirmation, :string
    
    ## social media verification pathways for partners
    add_column :partners, :twitter, :string
    add_column :partners, :instagram, :string
    add_column :partners, :facebook, :string
    add_column :partners, :pinterest, :string
    add_column :partners, :verified, :boolean, default: false
    add_column :partners, :verified_via, :string, default: ""
    add_column :partners, :preferred_shipper, :string
    
    ## social media verification pathways for customers
    add_column :customers, :twitter, :string
    add_column :customers, :instagram, :string
    add_column :customers, :facebook, :string
    add_column :customers, :pinterest, :string
    add_column :customers, :verified, :boolean, default: false
    add_column :customers, :verified_via, :string, default: ""
  end
end
