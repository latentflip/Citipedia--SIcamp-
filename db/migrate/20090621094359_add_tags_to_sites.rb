class AddTagsToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :tag, :string
  end

  def self.down
    remove_column :sites, :tag
  end
end
