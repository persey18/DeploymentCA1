class AddAttachmentImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t| # create a change table for the posts table 
      t.attachment :image #adds attachment of images
    end
  end

  def self.down
    remove_attachment :posts, :image
  end
end
