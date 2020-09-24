class AddItemIdToBrand < ActiveRecord::Migration[6.0]
  def change
    # :integerから:stringに変更
    add_column :brands, :item_id, :string
  end
end
