class AddPhotoToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :photo, :string
  end

  def self.down
    remove_column :sites, :photo
  end
end
