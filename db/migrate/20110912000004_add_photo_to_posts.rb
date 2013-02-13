class AddPhotoToPosts < ActiveRecord::Migration
  def self.down
    add_column :posts, :photo_file_name, :text, :limit => nil
    add_column :posts, :photo_content_type, :text, :limit => nil
    add_column :posts, :photo_file_size, :integer
  end

  def self.up
    remove_column :posts, :photo_file_size
    remove_column :posts, :photo_content_type
    remove_column :posts, :photo_file_name
  end
end
