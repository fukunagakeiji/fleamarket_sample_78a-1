class AddbuyerIdToItems < ActiveRecord::Migration[6.0]
  def change
    # seller(出品中)とbuyer(売却済み)で分ける
    add_reference :items, :seller, foreign_key: {to_table: :users}
    add_reference :items, :buyer, foreign_key: {to_table: :users}
  end
end
