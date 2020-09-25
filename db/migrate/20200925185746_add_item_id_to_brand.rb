class AddItemIdToBrand < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :item_id, :string
  end
end
