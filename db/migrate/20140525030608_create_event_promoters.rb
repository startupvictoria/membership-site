class CreateEventPromoters < ActiveRecord::Migration
  def change
    create_table :event_promoters do |t|
      t.string :code, unique: true, null: false
      t.string :name
      t.string :url

      t.timestamps
    end

    add_index :event_promoters, :code, unique: true
  end
end
