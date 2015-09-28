class CreateHarbours < ActiveRecord::Migration
  def change
    create_table :harbours do |t|
      t.string :name
      t.string :address
      t.string :city

      t.timestamps null: false
    end
  end
end
