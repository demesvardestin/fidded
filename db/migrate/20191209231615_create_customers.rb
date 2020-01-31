class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ""
      t.string :street_address
      t.string :town
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
