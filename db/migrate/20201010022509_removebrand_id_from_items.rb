class RemovebrandIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :brand_id
  end
end
