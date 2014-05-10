class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :customer_id,
        null: false

      t.string :plan_id,
        null: false

      t.foreign_key :customers
    end

    add_index :memberships, :customer_id, unique: true
  end
end
