class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :boat, index: true, foreign_key: true
      t.integer :total_price
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
