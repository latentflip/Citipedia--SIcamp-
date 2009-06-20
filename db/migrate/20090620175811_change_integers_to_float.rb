class ChangeIntegersToFloat < ActiveRecord::Migration
  def self.up
    change_column(:sites, :latitude, :float)
    change_column(:sites, :longitude, :float)
  end

  def self.down
    change_column(:sites, :latitude, :integer)
    change_column(:sites, :longitude, :integer)
  end
end
