class AddCustomerIdToFitPics < ActiveRecord::Migration[5.0]
  def change
    add_column :fit_pics, :customer_id, :integer
  end
end
