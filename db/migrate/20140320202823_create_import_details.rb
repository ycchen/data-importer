class CreateImportDetails < ActiveRecord::Migration
  def change
    create_table :import_details do |t|
      t.string :purchaser_name
      t.string :merchant_name
      t.string :merchant_address
      t.string :item_description
      t.decimal :item_price
      t.integer :purchase_count,:precision => 8, :scale => 2, :default => 0.0
      t.references :import, index: true

      t.timestamps
    end
  end
end
