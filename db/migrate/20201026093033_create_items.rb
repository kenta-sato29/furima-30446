class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text       :description,           null: false
      t.integer    :category_id,           null: false
      t.string     :item_name,             null: false
      t.integer    :status_id,             null: false
      t.integer    :price,                 null: false
      t.integer    :charge_id,             null: false
      t.integer    :shipment_source_id,    null: false
      t.integer    :day_id,                null: false
      t.references :user,                  null: false
      t.timestamps
    end
  end
end
