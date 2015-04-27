class CreateOrdersItemsJoinTable < ActiveRecord::Migration
    def self.up
      create_table :orders_items, :id => false do |t|
        t.integer :order_id
        t.integer :item_id
      end

      add_index :orders_items, [:order_id, :item_id]
    end

    def self.down
      drop_table :orders_items
    end
end
