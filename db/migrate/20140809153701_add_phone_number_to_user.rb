class AddPhoneNumberToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :phone_number
    end
  end
end
