class AddFlashToProposal < ActiveRecord::Migration
  def self.up
    add_column :proposals, :flash_data, :string
  end

  def self.down
    remove_column :proposals, :flash
  end
end
