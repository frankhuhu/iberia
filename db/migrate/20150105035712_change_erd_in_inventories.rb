class ChangeErdInInventories < ActiveRecord::Migration
  def self.up
      change_column :inventories, :erd, :datetime
  end

  def self.down
      change_column :inventories, :erd, :string
  end
end
