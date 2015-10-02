class AddAttachmentPictureToBoats < ActiveRecord::Migration
  def self.up
    change_table :boats do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :boats, :picture
  end
end
