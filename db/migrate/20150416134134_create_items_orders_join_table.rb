class CreateItemsOrdersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :items_orders, :id => false do |t|
      t.integer :order_id
      t.integer :item_id
    end

    add_index :items_orders, [:order_id, :item_id]
  end

  def self.down
    drop_table :items_orders
  end
end
