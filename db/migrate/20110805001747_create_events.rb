class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.text :title, :limit => nil
      t.text :location, :limit => nil
      t.text :description, :limit => nil
      t.datetime :event_start
      t.datetime :event_end

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
