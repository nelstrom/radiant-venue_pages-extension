class AddHideFromMapToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :hide_from_map, :boolean, :default => false
  end

  def self.down
    remove_column :pages, :hide_from_map
  end
end
