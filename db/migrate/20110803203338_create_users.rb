class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.text :email, :limit => nil
      t.text :password_hash, :limit => nil
      t.text :password_salt, :limit => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
