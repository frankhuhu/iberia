class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :company
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :address5

      t.timestamps
    end
  end
end
