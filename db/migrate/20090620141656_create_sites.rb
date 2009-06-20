class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.integer :latitude
      t.integer :longitude
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
