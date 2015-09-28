class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :capacity
      t.integer :size
      t.integer :price_per_day
      t.text :description

      t.timestamps null: false
    end
  end
end
