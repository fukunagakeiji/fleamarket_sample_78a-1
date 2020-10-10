require 'rails_helper'

# Itemモデルのテスト
describe Item do
  describe '#create' do
    it "is valid with a name, explain, status_id, delivery_fee, region, days, price, user_id, category_id" do
      user = create(:user)
      category = create(:category)
      #image = create(:image)
      item = FactoryBot.build(:item, user_id: user[:id], category_id: category[:id])
      # be_validはテストの対象に対してvalid?メソッドを呼んで、それが返す値によってテストの成否を判定するマッチャ。
      expect(item).to be_valid
    end
  end
end
