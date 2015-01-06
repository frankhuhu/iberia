class CreateInventoryIns < ActiveRecord::Migration
  def change
    create_table :inventory_ins do |t|
      t.string :invoice
      t.string :vendor
      t.datetime :in_date
      t.text :content
      t.datetime :paid_date
      t.string :po
      t.string :truck

      t.timestamps
    end
  end
end
