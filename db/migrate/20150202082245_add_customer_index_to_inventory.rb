class AddCustomerIndexToInventory < ActiveRecord::Migration
  def change
    add_index :inventories, :customer
  end
end
