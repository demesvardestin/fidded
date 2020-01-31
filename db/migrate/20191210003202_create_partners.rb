class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :email, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :town
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
