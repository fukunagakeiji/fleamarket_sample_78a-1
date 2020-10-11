class AddauctionIdToItems < ActiveRecord::Migration[6.0]
  def change
    # seller(出品中)とbuyer(売却済み)に出品中に取引中(auction)を追加
    add_reference :items, :auction, foreign_key: {to_table: :users}
  end
end
