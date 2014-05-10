class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :user_id,
        null: false

      t.string :stripe_id,
        null: false

      t.string :stripe_card_id,
        null: false

      t.timestamps null: false

      t.foreign_key :users
    end

    add_index :customers, :user_id, unique: true
  end
end
