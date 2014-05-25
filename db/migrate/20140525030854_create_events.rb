class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :short_description
      t.integer :event_venue_id
      t.integer :event_promoter_id
      t.string :url
      t.datetime :starts_at, null: false

      t.foreign_key :event_venues

      t.timestamps
    end

    add_index :events, :starts_at
  end
end
