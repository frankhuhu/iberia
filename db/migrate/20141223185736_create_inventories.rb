class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :invoice
      t.string :customer
      t.datetime :paid_date
      t.string :side
      t.string :o_f
      t.string :crt
      t.string :seal
      t.string :bale
      t.integer :weight
      t.string :bgk
      t.string :erd
      t.datetime :cutoff_date
      t.text :note
      t.datetime :in_date
      t.datetime :out_date
      t.string :bl
      t.string :pic
      t.string :truck
      t.string :paid

      t.timestamps
    end
  end
end
