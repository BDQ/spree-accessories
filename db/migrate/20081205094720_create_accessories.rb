class CreateAccessories < ActiveRecord::Migration
  def self.up
    create_table :accessories,{:id => false} do |t|
      t.references :product
      t.column :accessory_product_id,     :integer, :null => false
    end
  end

  def self.down
    drop_table :accessories
  end
end
