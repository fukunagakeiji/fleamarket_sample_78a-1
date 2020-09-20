class ItemsController < ApplicationController
  
  # 誰が出品したかわかるようにprivateに記載
  before_acton :set_user

  # 商品一覧表示
  def index
   
  end

  end

  # 商品の保存
  def create
    @item = @user.items.new(items_params)
     # 商品の保存に成功した場合、保存に失敗した場合で処理を分岐
    if @item.save
      redirect_to root_path(@user), notice: "商品が出品されました"
    else
      @items = @user.items.includes(:user)
      flash.now[:alert] = "メッセージを入力してください"
      render :listing
    end
  end

  # 商品購入
  def purchase
  end

  # 商品出品
  def listing
    # Itemモデルのインスタンスを生成
    @item = Item.new
    # ユーザーのすべての商品である@itemsを定義。「n+1問題」を避けるために、includes(:user)を記載。
    @items = @user.items.includes(:user)
  end

  # クラス外から呼び出すことのできないメソッド
  private

  # ストロングパラメーターを使って、指定したキーを持つパラメーターのみを受け取るように制限
  def items_params
    params.require(:item).permit(:name, :explain, :status, :delivery_fee, :region, :days, :price, :user_id, :category_id, :brand_id).merge(user_id: current_user.id)
  end

  # itemsコントローラーの全てのアクションで@userを利用できる
  def set_user
    @user = User.find(params[:user_id])
  end

end
