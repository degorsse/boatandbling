class AddAttachmentPictureToHarbours < ActiveRecord::Migration
  def self.up
    change_table :harbours do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :harbours, :picture
  end
end
