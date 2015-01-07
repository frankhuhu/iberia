class ChangeLastnameInCustomers < ActiveRecord::Migration
  def self.up
    change_table :customers do |t|
      t.rename :lastname, :company_id
    end
  end

  def self.down
    change_table :customers do |t|
      t.rename :company_id, :lastname
    end
  end
end
