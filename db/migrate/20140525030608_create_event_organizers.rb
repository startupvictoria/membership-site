class CreateEventOrganizers < ActiveRecord::Migration
  def change
    create_table :event_organizers do |t|
      t.string :code, unique: true, null: false
      t.string :name
      t.string :url

      t.timestamps
    end

    add_index :event_organizers, :code, unique: true
  end
end
