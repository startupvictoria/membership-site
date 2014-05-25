class CreateEventVenues < ActiveRecord::Migration
  def change
    create_table :event_venues do |t|
      t.string :code, unique: true, null: false
      t.string :name
      t.string :address
      t.string :url

      t.timestamps
    end

    add_index :event_venues, :code, unique: true
  end
end
