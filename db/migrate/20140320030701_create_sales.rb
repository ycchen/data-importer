class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :purchaser, index: true
      t.references :item, index: true
      t.references :merchant, index: true
      t.integer :unit
      t.decimal :item_cost, :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end
  end
end
