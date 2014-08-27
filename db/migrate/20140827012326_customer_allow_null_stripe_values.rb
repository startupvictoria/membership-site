class CustomerAllowNullStripeValues < ActiveRecord::Migration
  def up
    change_column :customers, :stripe_id,      :string, null: true, default: nil
    change_column :customers, :stripe_card_id, :string, null: true, default: nil
  end

  def down
    change_column :customers, :stripe_id,      :string, null: false
    change_column :customers, :stripe_card_id, :string, null: false
  end
end
