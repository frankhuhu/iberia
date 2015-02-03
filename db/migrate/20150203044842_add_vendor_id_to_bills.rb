class AddVendorIdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :vendor_id, :string
  end
end
