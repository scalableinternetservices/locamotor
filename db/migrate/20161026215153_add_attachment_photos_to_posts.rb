class AddAttachmentPhotosToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :posts, :photos
  end
end
