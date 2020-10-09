class CreateContactInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_informations do |t|
      t.string :destination_family_name, null: false
      t.string :destination_first_name, null: false
      t.string :destination_family_name_kana, null: false
      t.string :destination_first_name_kana, null: false
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :phone_number
      t.references :user, null: false
      t.timestamps
    end
    add_foreign_key :contact_informations, :users, column: :user_id
  end
end