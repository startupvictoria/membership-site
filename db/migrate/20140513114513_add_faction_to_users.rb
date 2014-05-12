class AddFactionToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :faction,
        null: false,
        default: 0
    end
  end
end
