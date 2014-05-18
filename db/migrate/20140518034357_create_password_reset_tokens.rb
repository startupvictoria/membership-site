class CreatePasswordResetTokens < ActiveRecord::Migration
  def change
    create_table :password_reset_tokens do |t|
      t.integer :user_id,
        null: false

      t.string :token,
        null: false

      t.boolean :active,
        null: false

      t.foreign_key :users

      t.timestamps
    end

    add_index :password_reset_tokens, :token
  end
end
