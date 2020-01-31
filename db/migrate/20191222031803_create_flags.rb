class CreateFlags < ActiveRecord::Migration[5.0]
  def change
    create_table :flags do |t|
      t.integer :item_request_id
      t.string :flagger_type
      t.integer :flagger_id
      t.string :reason
      t.text :details

      t.timestamps
    end
  end
end
