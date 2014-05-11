class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :name,
        unique: true,
        null: false

      t.string :teaser_name,
        null: false

      t.string :teaser_description,
        null: false

      t.string :company_name,
        null: false

      t.string :company_url,
        null: false

      t.string :company_about,
        null: false

      t.string :logo_filename,
        null: false

      t.text :description,
        null: false

      t.text :how_to_redeem,
        null: false

      t.timestamps
    end

    add_index :coupons, :name, :unique => true
  end
end
