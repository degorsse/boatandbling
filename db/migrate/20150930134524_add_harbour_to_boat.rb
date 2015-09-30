class AddHarbourToBoat < ActiveRecord::Migration
  def change
    add_reference :boats, :harbour, index: true, foreign_key: true
  end
end
