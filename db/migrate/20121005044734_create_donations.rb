class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.text :name, :limit => nil
      t.text :company, :limit => nil
      t.integer :amount
      t.text :description, :limit => nil

      t.timestamps
    end
  end
end
