class RenameOffersLogoUrlToLogoFilename < ActiveRecord::Migration
  def self.up
    rename_column :offers, :logo_url, :logo_filename
  end

  def self.down
    rename_column :offers, :logo_filename, :logo_url
  end
  
end
