class AddTypeToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :btype, :string
  end

  def self.down
    remove_column :sites, :btype
  end
end
