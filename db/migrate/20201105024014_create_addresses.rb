class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post,                  null: false
      t.integer    :shipment_source_id,    null: false
      t.string     :first_number,          null: false
      t.string     :second_number,         null: false
      t.string     :building_name
      t.string     :tel,                   null: false
      t.references :purchase,              null: false, foreign_key: true 
      t.timestamps
    end
  end
end
