class CreateTruckings < ActiveRecord::Migration
  def change
    create_table :truckings do |t|
      t.string :vendor_po
      t.string :vendor
      t.string :truck_po
      t.string :trucker
      t.string :pol
      t.datetime :order_date
      t.datetime :received_date
      t.string :commodity
      t.string :remarks

      t.timestamps
    end
  end
end
