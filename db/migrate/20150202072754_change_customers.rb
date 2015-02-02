class ChangeCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :fax, :string
    add_column :customers, :bill_address, :string
    add_column :customers, :method, :string
    remove_column :customers, :address1, :string
    remove_column :customers, :address2, :string
    remove_column :customers, :address3, :string
    remove_column :customers, :address4, :string
    remove_column :customers, :address5, :string
  end
end
