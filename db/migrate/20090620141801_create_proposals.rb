class CreateProposals < ActiveRecord::Migration
  def self.up
    create_table :proposals do |t|
      t.text :description
      t.references :site

      t.timestamps
    end
  end

  def self.down
    drop_table :proposals
  end
end
