class AddCompletedToItemRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :item_requests, :completed, :boolean, default: false
  end
end
