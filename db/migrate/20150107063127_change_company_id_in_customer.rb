class ChangeCompanyIdInCustomer < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.rename :company_id, :customer_id
    end
  end

  def self.down
    change_table :customers do |t|
      t.rename :customer_id, :company_id
    end
  end
end
