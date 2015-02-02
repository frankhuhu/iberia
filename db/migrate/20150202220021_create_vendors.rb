class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :contact
      t.string :vendor_id
      t.string :phone
      t.string :fax
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
