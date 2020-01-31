class AddAhoyVisitIdToItemRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :item_requests, :ahoy_visit_id, :integer
  end
end
