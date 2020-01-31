class AddCategoryToItemRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :item_requests, :category, :string, default: ""
    add_column :item_requests, :uid, :string, default: ""
  end
end
