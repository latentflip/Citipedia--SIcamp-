class AddInfoToTables < ActiveRecord::Migration
  def self.up
    add_column :sites, :status, :string
    add_column :proposals, :title, :string
    add_column :comments, :avatar, :string
  end

  def self.down
    remove_column :sites, :status
    remove_column :proposals, :title
    remove_column :comments, :avatar
  end
end
