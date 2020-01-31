class AddReadByDetailsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :read_by_customer, :boolean, default: false
    add_column :messages, :read_by_partner, :boolean, default: false
  end
end
