require 'rails_helper'

# Itemモデルのテスト
describe Item do
  describe '#create' do
    # 1.出品の必須項目がすべて入力してある時は出品することができる
    it "is valid with a name, explain, status_id, delivery_fee, region, days, price, user_id, category_id" do
      user = create(:user)
      category = create(:category)
      item = FactoryBot.build(:item, seller_id: user[:id], category_id: category[:id])
      # be_validはテストの対象に対してvalid?メソッドを呼んで、それが返す値によってテストの成否を判定するマッチャ。
      expect(item).to be_valid
    end

    # 2.商品名がなければ出品できない
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    # 3.商品の説明がなければ出品できない
    it "is invalid without a explain" do
      item = build(:item, explain: nil)
      item.valid?
      expect(item.errors[:explain]).to include("を入力してください")
    end

    # 4.商品の状態について入力がなければ出品できない
    it "is invalid without a status_id" do
      item = build(:item, status_id: nil)
      item.valid?
      expect(item.errors[:status_id]).to include("を入力してください")
    end

    # 5.配送料の負担についての入力がなければ出品できない
    it "is invalid without a deliveryfee_id" do
      item = build(:item, deliveryfee_id: nil)
      item.valid?
      expect(item.errors[:deliveryfee_id]).to include("を入力してください")
    end

    # 6.発送元の地域についての入力がなければ出品できない
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    # 7.発送までの日数についての入力がなければ出品できない
    it "is invalid without a shippingdays_id" do
      item = build(:item, shippingdays_id: nil)
      item.valid?
      expect(item.errors[:shippingdays_id]).to include("を入力してください")
    end

    # 8.価格が入力されていなければ出品できない
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    # 9.必須と表現していないカラム(brand_id)が空の時は出品できる
    it "is valid without a brand_id" do
      item = build(:item, brand_id: nil)
      expect(item).to be_valid
    end
  end
end

describe Image do
  describe "#create" do
    # 10.画像が空では出品できない
    it "is invalid without a image" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end
  end
end