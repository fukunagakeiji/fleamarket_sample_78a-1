class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explain, null: false
      t.string :status, null: false
      t.string :delivery_fee, null: false
      t.string :region, null: false
      t.string :days, null: false
      t.string :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.integer :brand_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
