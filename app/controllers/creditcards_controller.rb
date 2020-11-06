class CreditcardsController < ApplicationController
  # ログイン済みのユーザーのみにクレジットカード登録へのアクセスを許可
  before_action :authenticate_user!
  require "payjp"

  # クレジットカード登録画面の表示(payjp)
  def new
    card = Creditcard.where(user_id: current_user.id)
  end

  # クレジットカードの保存
  def create
    Payjp.api_key = 'sk_test_92e017bea9f22bf617d74e26'
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Creditcard.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card
      )
      if @card.save
        redirect_to root_path, notice: "クレジットカードが登録されました"
      else
        render :new, notice: "クレジットカードの登録に失敗しました"
      end
    end
  end

  # クレジットカードの削除
  def destroy
    
  end

end
