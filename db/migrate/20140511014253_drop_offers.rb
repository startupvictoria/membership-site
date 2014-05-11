class DropOffers < ActiveRecord::Migration
  def up
    drop_table :offers if table_exists? :offers
  end
end
