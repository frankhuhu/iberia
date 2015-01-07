class ChangeCustomeIdInCustomer < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.rename :customer_id, :contact
    end
  end

  def self.down
    change_table :customers do |t|
      t.rename :contact, :customer_id
    end
  end
end
