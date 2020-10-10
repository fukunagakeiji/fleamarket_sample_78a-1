class AddbrandIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :brand_id, :integer, foreign_key: true
  end
end
