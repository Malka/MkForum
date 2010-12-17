class AddDefaultToActifToForums < ActiveRecord::Migration
  def self.up
    change_column(:forums, :actif, :boolean, :default => true)
  end

  def self.down
    change_column(:forums, :actif, :boolean)
  end
end
