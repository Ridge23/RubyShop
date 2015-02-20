class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :short_description
      t.text :description
      t.integer :priority_id

      t.timestamps
    end
  end
end
