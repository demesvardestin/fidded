class AddImageToCustomersAndPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :image, :string
    add_column :partners, :image, :string
  end
end
