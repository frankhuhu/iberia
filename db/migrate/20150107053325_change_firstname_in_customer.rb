class ChangeFirstnameInCustomer < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.rename :firstname, :customer_id
    end
  end

  def self.down
    change_table :customers do |t|
      t.rename :customer_id, :firstname
    end
  end
end
