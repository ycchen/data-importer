class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.integer :record_count
      t.decimal :total_gross_revenue
      t.boolean :completed
      t.attachment :file

      t.timestamps
    end
  end
end
