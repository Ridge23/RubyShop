class AddShowOnMainToItem < ActiveRecord::Migration
  def change
    add_column :items, :show_on_main, :boolean
  end
end
