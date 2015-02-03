class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :bill_no
      t.string :customer_id
      t.boolean :billable
      t.datetime :bill_date
      t.datetime :paid_date
      t.string :freight
      t.text :memo

      t.timestamps
    end
  end
end
