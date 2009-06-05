class AddVenueFieldsToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :gmap, :boolean
    add_column :pages, :lat, :string
    add_column :pages, :lng, :string
    add_column :pages, :street_address, :string
    add_column :pages, :postcode, :string
    add_column :pages, :venue_url, :string
    add_column :pages, :phone, :string
  end

  def self.down
    remove_column :pages, :phone
    remove_column :pages, :venue_url
    remove_column :pages, :postcode
    remove_column :pages, :street_address
    remove_column :pages, :lng
    remove_column :pages, :lat
    remove_column :pages, :gmap
  end
end
