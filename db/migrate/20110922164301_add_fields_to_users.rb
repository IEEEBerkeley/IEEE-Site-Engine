class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :text, :limit => nil
    add_column :users, :year, :integer
    add_column :users, :position, :text, :limit => nil

  end

  def self.down
    remove_column :users, :position
    remove_column :users, :year
    remove_column :users, :name
  end
end
