class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :is_finished, :boolean
  end
end
