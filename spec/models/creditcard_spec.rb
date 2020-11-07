require 'rails_helper'
describe Creditcard do
  
  before do
    @creditcard = build(:creditcard)
  end

  describe 'カード登録' do
    context 'うまくいくとき' do
      it "必須項目が(すべて)があれば登録できる" do
        expect(@creditcard).to be_valid
      end
      it "ユーザーIDがあれば登録できる" do
        @creditcard.user_id = build(:user)
        expect(@creditcard).to be_valid
      end
      it "カスタマーIDがあれば登録できる" do
        @creditcard.customer_id = "cus_3f3dd31a5e4988871900b59ce437"
        expect(@creditcard).to be_valid
      end
      it "カードIDがあれば登録できる" do
        @creditcard.card_id = "car_67148c02a56939e882b13c218bf7"
        expect(@creditcard).to be_valid
      end
    end

    context 'うまくいかないとき' do
      it "user_idが一意でないと登録できない" do
        @another_card = create(:creditcard)
        @creditcard.user_id = @another_card.user_id
        @creditcard.valid?
        expect(@creditcard.errors.full_messages).to include("Userはすでに存在します")
      end
      it "カスタマーIDがないと登録できない" do
        @creditcard.customer_id = ''
        @creditcard.valid?
        expect(@creditcard.errors.full_messages).to include("Customerを入力してください")
      end
      it "カードIDがないと登録できない" do
        @creditcard.card_id = ''
        @creditcard.valid?
        expect(@creditcard.errors.full_messages).to include("Cardを入力してください")
      end
    end
  end
end