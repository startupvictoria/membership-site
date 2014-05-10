class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :stripe_id,
        null: false

      t.string :stripe_card_id,
        null: false

      t.timestamps null: false
    end
  end
end
